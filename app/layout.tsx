import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

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
  openGraph: {
    title: "Rocket Quest – Epic Space ",
    description: "Rocket Quest, build & boost your rocket! ...",
    type: "website",
    locale: "en_US",
    url: "https://rocket-quest.vercel.app",
    images: [
      {
        url: "https://rocket-quest.vercel.app/rocket_quest.png",
        width: 1200,
        height: 630,
        alt: "Rocket Quest – Epic Space",
      },
    ],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <meta property="og:image" content="<generated>" />
        <meta property="og:image:type" content="<generated>" />
        <meta property="og:image:width" content="<generated>" />
        <meta property="og:image:height" content="<generated>" />
      </head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased font-mono`}
      >
        {children}
      </body>
    </html>
  );
}
