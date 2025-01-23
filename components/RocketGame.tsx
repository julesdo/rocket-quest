"use client"

import { useEffect, useRef, useState } from "react"
import RocketSidebar from "./RocketSidebar"
import { supabase } from "../supabase"

// === Types & constantes ===
interface Rocket {
    position: number
    clicks: number
    velocity: number
    flag: string
}
interface Rockets {
    [key: string]: Rocket
}
interface Planet {
    name: string
    distance: number
    color: string
    size: number
}
const CANVAS_WIDTH = 1200
const CANVAS_HEIGHT = 800

const MAX_ZOOM = 1e6
const MIN_ZOOM = 1e-5

const distanceFactor = 1
const planetSizeFactor = 0.00005
const rocketSizeFactor = 0.000005
const ROCKET_SIZE = 100
const MIN_ROCKET_PIXEL_SIZE = 10

const planets: Planet[] = [
    { name: "Moon", distance: 10, color: "#fafafa", size: 1274200 },
    { name: "Mars", distance: 227.9, color: "#c1440e", size: 677900 },
    { name: "Jupiter", distance: 778.5, color: "#d8ca9d", size: 1398200 },
    { name: "Saturn", distance: 1433.4, color: "#e3cda4", size: 1164600 },
    { name: "Uranus", distance: 2872.5, color: "#7fffd4", size: 507240 },
    { name: "Neptune", distance: 4495.1, color: "#00a2e8", size: 492440 },
    { name: "Pluto", distance: 5906.4, color: "#d9d6cf", size: 237600 },
]
// Exoplanètes factices
for (let i = 1; i <= 5; i++) {
    const last = planets[planets.length - 1]
    const newDistance = last.distance * (1 + Math.random() * 0.5 + 0.5)
    planets.push({
        name: `Exoplanet-${i}`,
        distance: newDistance,
        color: `hsl(${Math.random() * 360}, 50%, 50%)`,
        size: 5000 + Math.random() * 10000,
    })
}

export default function RocketGame() {

    const canvasRef = useRef<HTMLCanvasElement>(null) as React.MutableRefObject<HTMLCanvasElement>
    const [rockets, setRockets] = useState<Rockets>({})
    const [search, setSearch] = useState("")
    const [zoom, setZoom] = useState(0.5)
    const zoomRef = useRef(zoom)
    const targetZoomRef = useRef(0.5)
    const starsRef = useRef<{ x: number; y: number; z: number; radius: number }[]>([])

    const animRef = useRef<number>(0)

    // ID unique pour ce client
    const [myUserID] = useState(() => crypto.randomUUID())

    // Ensemble des utilisateurs connectés
    const [connectedUsers, setConnectedUsers] = useState<Set<string>>(new Set())

    // Channel pour la "presence"
    const presenceChannelRef = useRef(
        supabase.channel("rocket-wars-presence", {
            config: { broadcast: { self: true } },
        })
    )

    useEffect(() => {
        const presenceChannel = presenceChannelRef.current

        // 1) Écoute les événements "presence-join" / "presence-leave"
        presenceChannel
            .on("broadcast", { event: "presence-join" }, (payload) => {
                const userIDJoined = payload.payload as string
                console.log("[presence-join]", userIDJoined)

                setConnectedUsers((prev) => {
                    const copy = new Set(prev)
                    copy.add(userIDJoined)
                    return copy
                })
            })
            .on("broadcast", { event: "presence-leave" }, (payload) => {
                const userIDLeft = payload.payload as string
                console.log("[presence-leave]", userIDLeft)

                setConnectedUsers((prev) => {
                    const copy = new Set(prev)
                    copy.delete(userIDLeft)
                    return copy
                })
            })
            .subscribe((status) => {
                // 2) Quand on est abonné, on envoie "presence-join"
                if (status === "SUBSCRIBED") {
                    console.log("Presence channel SUBSCRIBED")
                    presenceChannel.send({
                        type: "broadcast",
                        event: "presence-join",
                        payload: myUserID,
                    })
                }
            })

        // 3) À la fermeture de page ou la fin
        const onUnload = () => {
            // Envoi "presence-leave"
            presenceChannel.send({
                type: "broadcast",
                event: "presence-leave",
                payload: myUserID,
            })
        }
        window.addEventListener("beforeunload", onUnload)

        return () => {
            // On envoie "presence-leave" si on démonte le composant
            presenceChannel.send({
                type: "broadcast",
                event: "presence-leave",
                payload: myUserID,
            })

            window.removeEventListener("beforeunload", onUnload)
            supabase.removeChannel(presenceChannel)
        }
    }, [myUserID])

    // Channel Broadcast
    const channelRef = useRef(
        supabase.channel("rocket-wars", {
            config: { broadcast: { self: true } },
        })
    )

    // Au montage : charger la table + s'abonner
    useEffect(() => {
        // 1) Charger la table
        supabase
            .from("rockets")
            .select("*")
            .then(({ data, error }) => {
                if (error) {
                    console.error("Error loading rockets:", error)
                    return
                }
                if (data) {
                    const initial: Rockets = {}
                    data.forEach((row ) => {
                        initial[row.nation] = {
                            position: row.position,
                            clicks: row.clicks,
                            velocity: row.velocity,
                            flag: row.flag || "",
                        }
                    })
                    console.log("Loaded from DB =>", initial)
                    setRockets(initial)
                }
            })

        // 2) Souscrire au broadcast
        const ch = channelRef.current
            .on("broadcast", { event: "rocket-sync" }, (payload) => {
                console.log("[Broadcast received]", payload.payload)
                setRockets(payload.payload)
            })
            .subscribe((status) => {
                if (status === "SUBSCRIBED") {
                    console.log("Connected to rocket-wars channel (broadcast)")
                }
            })

        return () => {
            supabase.removeChannel(ch)
        }
    }, [])

    // MàJ la ref zoom
    useEffect(() => {
        zoomRef.current = zoom
    }, [zoom])

    // Interval pour calculer la position => upsert => broadcast
    useEffect(() => {
        const interval = setInterval(() => {
            setRockets((prev) => {
                const updated: Rockets = {}
                for (const nation in prev) {
                    const r = prev[nation]
                    const accel = r.clicks * 0.00000001
                    const newVelocity = r.velocity + accel
                    const newPosition = r.position + newVelocity * 0.000001
                    updated[nation] = {
                        ...r,
                        velocity: newVelocity,
                        position: newPosition,
                    }
                }
                // Sauvegarde en DB via upsert (au lieu de update)
                // upsert => si la row n'existe pas, elle est créée
                // si elle existe, elle est mise à jour
                const rows = Object.entries(updated).map(([nation, val]) => ({
                    nation,
                    position: val.position,
                    velocity: val.velocity,
                }))
                supabase
                    .from("rockets")
                    .upsert(rows)
                    .then(({ error }) => {
                        if (error) {
                            console.error("Error upserting rockets:", error)
                        }
                    })

                // Broadcast le nouvel état complet
                channelRef.current.send({
                    type: "broadcast",
                    event: "rocket-sync",
                    payload: updated,
                })

                return updated
            })
        }, 1500) // ex. toutes les 1.5s

        return () => clearInterval(interval)
    }, [])

    // Dessin canvas
    useEffect(() => {
        const canvas = canvasRef.current
        if (!canvas) return
        const ctx = canvas.getContext("2d")
        if (!ctx) return

        if (starsRef.current.length === 0) {
            starsRef.current = Array.from({ length: 800 }, () => ({
                x: Math.random() * CANVAS_WIDTH - CANVAS_WIDTH / 2,
                y: Math.random() * CANVAS_HEIGHT - CANVAS_HEIGHT / 2,
                z: Math.random() * CANVAS_WIDTH,
                radius: Math.random() * 1.5,
            }))
        }

        const maxDistance = planets[planets.length - 1].distance
        const logMax = Math.log10(maxDistance + 1)
        const baseScale = (CANVAS_WIDTH - 100) / logMax

        function moveStars() {
            starsRef.current.forEach((star) => {
                star.z -= 0.5
                if (star.z <= 0) {
                    star.z = CANVAS_WIDTH
                    star.x = Math.random() * CANVAS_WIDTH - CANVAS_WIDTH / 2
                    star.y = Math.random() * CANVAS_HEIGHT - CANVAS_HEIGHT / 2
                }
            })
        }
        function drawStars() {
            ctx.fillStyle = "white"
            for (const star of starsRef.current) {
                const sx = star.x / (star.z / CANVAS_WIDTH) + CANVAS_WIDTH / 2
                const sy = star.y / (star.z / CANVAS_WIDTH) + CANVAS_HEIGHT / 2
                const radius = star.radius * (1 - star.z / CANVAS_WIDTH)
                ctx.beginPath()
                ctx.arc(sx, sy, radius, 0, Math.PI * 2)
                ctx.fill()
            }
        }

        function drawPlanet(p: Planet, currentZoom: number) {
            const distLog = Math.log10(p.distance + 1)
            const x = 50 + distLog * baseScale * distanceFactor * currentZoom
            const y = CANVAS_HEIGHT / 2

            const size = p.size * planetSizeFactor * currentZoom
            const displaySize = Math.max(2, size / 2)
            if (x + displaySize < 0 || x - displaySize > CANVAS_WIDTH) return

            ctx.beginPath()
            ctx.arc(x, y, displaySize, 0, Math.PI * 2)
            ctx.fillStyle = p.color
            ctx.fill()

            ctx.fillStyle = "white"
            ctx.font = "14px Arial"
            ctx.textAlign = "center"
            ctx.fillText(p.name, x, y + displaySize + 15)
        }

        const flagCache: Record<string, HTMLImageElement> = {}

        function drawRocket(nation: string, rocket: Rocket, currentZoom: number) {
            const distLog = Math.log10(rocket.position + 1)
            const x = 50 + distLog * baseScale * distanceFactor * currentZoom
            const y = CANVAS_HEIGHT / 2

            let size = ROCKET_SIZE * rocketSizeFactor * currentZoom
            size = Math.max(size, MIN_ROCKET_PIXEL_SIZE)

            const screenSize = Math.min(CANVAS_WIDTH, CANVAS_HEIGHT)
            if (x + size < 0 || x - size > CANVAS_WIDTH) return

            ctx.save()
            ctx.translate(x, y)
            ctx.rotate(Math.PI / 2)

            // Corps
            ctx.fillStyle = "#0052A5"
            ctx.beginPath()
            ctx.moveTo(0, -size)
            ctx.lineTo(-size / 2, size)
            ctx.lineTo(size / 2, size)
            ctx.closePath()
            ctx.fill()

            // Drapeau
            if (rocket.flag) {
                if (!flagCache[rocket.flag]) {
                    const img = new Image()
                    img.crossOrigin = "anonymous"
                    img.src = rocket.flag
                    flagCache[rocket.flag] = img
                }
                const img = flagCache[rocket.flag]
                if (img && img.complete && img.naturalWidth > 0 && img.naturalHeight > 0) {
                    ctx.drawImage(img, -size / 2, -size * 1.2, size, size * 0.6)
                }
            }

            // Fenêtre/flamme
            if (size > screenSize * 0.01) {
                // Fenêtre
                ctx.fillStyle = "skyblue"
                ctx.beginPath()
                ctx.arc(0, 0, size / 4, 0, Math.PI * 2)
                ctx.fill()

                // Flamme
                const flameHeight = (Math.random() * 0.5 + 0.5) * size
                const gradient = ctx.createLinearGradient(0, size, 0, size + flameHeight)
                gradient.addColorStop(0, "yellow")
                gradient.addColorStop(1, "red")
                ctx.fillStyle = gradient
                ctx.beginPath()
                ctx.moveTo(-size / 4, size)
                ctx.lineTo(0, size + flameHeight)
                ctx.lineTo(size / 4, size)
                ctx.closePath()
                ctx.fill()
            }

            ctx.restore()

            if (size > screenSize * 0.05) {
                ctx.fillStyle = "white"
                ctx.font = "12px Arial"
                ctx.textAlign = "center"
                ctx.fillText(nation, x, y + size + 15)
            }
        }

        function drawScaleBar(currentZoom: number) {
            const barWidthPx = 100
            const maxDist = planets[planets.length - 1].distance
            const baseScale = (CANVAS_WIDTH - 100) / Math.log10(maxDist + 1)
            const pxToBnKm = 1 / (baseScale * distanceFactor * currentZoom)

            let barDistance = barWidthPx * pxToBnKm
            const magn = Math.pow(10, Math.floor(Math.log10(barDistance)))
            const leading = barDistance / magn
            let niceLeading
            if (leading < 2) niceLeading = 1
            else if (leading < 5) niceLeading = 2
            else if (leading < 10) niceLeading = 5
            else niceLeading = 10
            barDistance = niceLeading * magn
            const actualWidthPx = barDistance / pxToBnKm

            const x = 30
            const y = CANVAS_HEIGHT - 30
            ctx.fillStyle = "white"
            ctx.fillRect(x, y, actualWidthPx, 6)
            ctx.font = "14px Arial"
            ctx.fillText(`                       ${barDistance.toFixed(2)} bn km`, x + actualWidthPx + 10, y + 10)
        }

        // Podium (optionnel)
        function drawPodium(current: Rockets) {
            const sorted = Object.entries(current).sort(
                (a, b) => b[1].position - a[1].position
            )
            const top3 = sorted.slice(0, 3)

            const px = 20
            const py = 20
            const w = 200
            const h = 100
            ctx.fillStyle = "rgba(0,0,0,0.5)"
            ctx.fillRect(px, py, w, h)

            ctx.fillStyle = "white"
            ctx.font = "16px Arial"
            ctx.fillText("PODIUM", px + 10, py + 20)

            ctx.font = "14px Arial"
            top3.forEach(([nation, r], i) => {
                const rank = i + 1
                const dist = r.position.toFixed(2)
                ctx.fillText(`${rank}. ${nation}: ${dist} bn km`, px + 10, py + 40 + i * 20)
            })
        }

        // Boucle d'animation
        const animate = () => {
            const currentZoom = zoomRef.current
            const ctx2 = ctx
            ctx2.fillStyle = "black"
            ctx2.fillRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT)

            moveStars()
            drawStars()

            planets.forEach((p) => drawPlanet(p, currentZoom))
            Object.entries(rockets).forEach(([nation, r]) => {
                drawRocket(nation, r, currentZoom)
            })

            drawScaleBar(currentZoom)
            drawPodium(rockets)

            if (Math.abs(currentZoom - targetZoomRef.current) > 0.01) {
                setZoom((prev) => prev + (targetZoomRef.current - prev) * 0.1)
            }

            animRef.current = requestAnimationFrame(animate)
        }

        animRef.current = requestAnimationFrame(animate)
        return () => {
            if (animRef.current) cancelAnimationFrame(animRef.current)
        }
    }, [rockets])

    ///////////////////////////////////////////////////////
    //      ACTIONS/EVENTS
    ///////////////////////////////////////////////////////
    // handleBoost => local + upsert + broadcast
    const handleBoost = (nation: string) => {
        setRockets((prev) => {
            const rocket = prev[nation]
            if (!rocket) return prev
            const updated = {
                ...prev,
                [nation]: {
                    ...rocket,
                    clicks: rocket.clicks + 1,
                },
            }

            supabase
                .from("rockets")
                .upsert({
                    nation,
                    clicks: rocket.clicks + 1,
                })
                .then(({ error }) => {
                    if (error) {
                        console.error("Error upserting rocket (boost):", error)
                    }
                })

            // broadcast l'état complet
            channelRef.current.send({
                type: "broadcast",
                event: "rocket-sync",
                payload: updated,
            })

            return updated
        })
    }

    // Locate => boost + search
    const handleLocate = async () => {
        try {
            const resp = await fetch("https://ipapi.co/json/")
            const data = await resp.json()
            const userCountry = data.country_name
            if (userCountry && rockets[userCountry]) {
                alert(`You are from ${userCountry}. Boosting your rocket!`)
                handleBoost(userCountry)
                setSearch(userCountry)
            } else {
                alert("Your country is not in the game!")
            }
        } catch {
            alert("Unable to locate your country.")
        }
    }

    // Zoom molette
    const handleWheel = (e: React.WheelEvent<HTMLCanvasElement>) => {
        e.preventDefault()
        const zoomFactor = e.deltaY > 0 ? 1.2 : 0.8
        targetZoomRef.current = Math.min(MAX_ZOOM, Math.max(MIN_ZOOM, targetZoomRef.current * zoomFactor))
    }

    return (
         <div className="flex flex-col lg:flex-row w-full h-screen bg-gray-900">
            <div>
                <h1 className="text-3xl font-bold text-white p-4">Rocket Quest</h1>
                <div className="text-white p-4">
                    Connected users: {connectedUsers.size}
                </div>
            </div>
    {/* Canvas Section */}
    <div className="flex-1 relative w-full lg:w-auto">
      <canvas
        ref={canvasRef}
        width={CANVAS_WIDTH}
        height={CANVAS_HEIGHT}
        className="border border-gray-700 rounded-lg m-4 w-[80vw] md:w-auto"
        onWheel={handleWheel}
      />
    </div>

    {/* Sidebar Section */}
    <RocketSidebar
      rockets={rockets}
      onBoost={handleBoost}
      onLocate={handleLocate}
      search={search}
      setSearch={setSearch}
    />
  </div>
    )
}
