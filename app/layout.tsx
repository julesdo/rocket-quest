import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Head from "next/head";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Rocket Quest – Epic Space Race",
  description: "Rocket Quest, build & boost your rocket! ...",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
            <Head>
        
        {/* Balises Open Graph */}
        <meta property="og:title" content="Rocket Wars: The Ultimate Space Race" />
        <meta property="og:description" content="Compete with nations around the globe..." />
        <meta property="og:url" content="https://rocket-quest.vercel.app/rocket_quest.png" />
        <meta property="og:type" content="website" />
        <meta property="og:image" content="https://rocket-quest.vercel.app/rocket_quest.png" />
        <meta property="og:site_name" content="MySite" />

        {/* Twitter Card (optionnel) */}
        <meta name="twitter:card" content="summary_large_image" />
      </Head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-mono`}
      >
        {children}
      </body>
    </html>
  );
}
