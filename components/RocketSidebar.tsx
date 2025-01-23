"use client"

import React from "react"

interface Rocket {
  position: number
  clicks: number
  velocity: number
  flag: string
}
interface Rockets {
  [key: string]: Rocket
}

interface RocketSidebarProps {
  rockets: Rockets
  onBoost: (nation: string) => void
  onLocate: () => void
  search: string
  setSearch: (val: string) => void
    className?: string
}

const RocketSidebar: React.FC<RocketSidebarProps> = ({
  rockets,
  onBoost,
  onLocate,
  search,
  setSearch,
    ...props
}) => {
  // Tri + filtrage
  const filtered = Object.entries(rockets).filter(([nation]) =>
    nation.toLowerCase().includes(search.toLowerCase())
  )

  // On peut trier par distance, etc., si on veut
  // filtered.sort((a, b) => b[1].position - a[1].position) // Ex: tri par position DESC

  return (
    <div
    className={
        // Merge classes passées en props + classes par défaut
        `overflow-y-auto p-4 text-white ${props.className ?? ""}`
      }
    >
      {/* Barre de recherche + Locate Me */}
      <div className="flex sticky top-0 bg-gray-800 p-2 rounded mb-4">
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search your country"
          className="flex-grow px-2 py-1 rounded-lg bg-gray-700 text-white"
        />
        <button
          onClick={onLocate}
          className="px-2 bg-blue-600 text-white rounded-r hover:bg-blue-700"
        >
          Locate Me
        </button>
      </div>

      {/* Liste scrollable */}
      <div className="overflow-y-auto flex-1 space-y-4">
        {filtered.map(([nation, rocket]) => (
          <div
            key={nation}
            className="bg-gray-700 rounded p-3 flex flex-col text-white"
          >
            {/* Header fusée */}
            <div className="flex items-center justify-between">
              <div className="font-bold text-lg">{nation}</div>
              <img src={rocket.flag} alt={`${nation} flag`} className="w-6 h-4" />
            </div>

            {/* Infos */}
            <div className="mt-2 text-sm space-y-1">
              <div>Distance: {rocket.position.toFixed(2)} bn km</div>
              <div>Speed: {rocket.velocity.toFixed(2)} km/s</div>
              <div>Clicks: {rocket.clicks}</div>
            </div>

            {/* Bouton Boost */}
            <button
              onClick={() => onBoost(nation)}
              className="mt-2 py-1 px-2 bg-green-600 hover:bg-green-700 rounded"
            >
              Boost
            </button>
          </div>
        ))}
      </div>
    </div>
  )
}

export default RocketSidebar
