import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Enable experimental features for better performance
  experimental: {
    optimizePackageImports: ['lucide-react', 'framer-motion']
  },
  
  // Image optimization
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'images.unsplash.com',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'picsum.photos',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'i.pinimg.com',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'dokenzmen.com',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'royal-artisanat.store',
        port: '',
        pathname: '/**',
      },
    ],
  },
  
  // ESLint configuration for builds
  eslint: {
    // Only run ESLint on these directories during build
    dirs: ['src'],
    // Allow production builds to complete even with ESLint errors
    ignoreDuringBuilds: process.env.NODE_ENV === 'production',
  },
  
  // TypeScript configuration
  typescript: {
    // Dangerously allow production builds to successfully complete even if your project has type errors
    ignoreBuildErrors: process.env.NODE_ENV === 'production',
  },
};

export default nextConfig;
