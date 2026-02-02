'use client';

import React from 'react';
import { motion } from 'framer-motion';
import Link from 'next/link';
import { ArrowRight } from 'lucide-react';

const Hero = () => {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-b from-amber-50/50 to-white">
      {/* Subtle dot pattern background */}
      <div className="absolute inset-0 opacity-[0.02]">
        <div className="absolute inset-0" style={{ backgroundImage: 'radial-gradient(circle, #000 1px, transparent 1px)', backgroundSize: '30px 30px' }} />
      </div>

      {/* Background Image with elegant overlay */}
      <div 
        className="absolute inset-0 bg-cover bg-center bg-no-repeat opacity-10"
        style={{
          backgroundImage: "url('https://royal-artisanat.store/images/royart/about-banner-01.png')"
        }}
      />
      
      {/* Main Content */}
      <div className="relative z-10 container mx-auto px-6 sm:px-8 lg:px-12 text-center">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, ease: [0.22, 1, 0.36, 1] }}
          className="max-w-5xl mx-auto"
        >
          {/* Top Badge */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.2 }}
            className="flex items-center justify-center gap-3 mb-8"
          >
            <div className="h-px w-12 bg-amber-400" />
            <span className="text-sm tracking-[0.2em] text-amber-700 uppercase font-light">Depuis 1995</span>
            <div className="h-px w-12 bg-amber-400" />
          </motion.div>

          {/* Main Heading */}
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.3, ease: [0.22, 1, 0.36, 1] }}
            className="text-5xl sm:text-6xl lg:text-7xl font-light text-gray-900 mb-6 leading-tight"
          >
            Bienvenue chez{' '}
            <span className="block font-serif italic text-amber-800 mt-2">Royal Artisanat</span>
          </motion.h1>

          {/* Subtitle */}
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.4 }}
            className="text-xl sm:text-2xl text-gray-600 mb-4 max-w-3xl mx-auto leading-relaxed font-light"
          >
            Découvrez notre collection unique de sacs artisanaux pour femmes, faits à la main en Tunisie
          </motion.p>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.5 }}
            className="text-base sm:text-lg text-gray-500 mb-12 max-w-2xl mx-auto font-light"
          >
            Où le vrai style est toujours dans vos mains. Élégance et pratique pour chaque occasion.
          </motion.p>

          {/* CTA Buttons */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.6 }}
            className="flex flex-col sm:flex-row items-center justify-center gap-6 mb-20"
          >
            <Link href="/shop">
              <motion.button
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                className="bg-amber-600 hover:bg-amber-700 text-white px-10 py-4 font-light tracking-wide transition-colors inline-flex items-center gap-3"
              >
                <span>Découvrir la Collection</span>
                <ArrowRight className="w-5 h-5" />
              </motion.button>
            </Link>
            
            <Link href="/about">
              <motion.button
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                className="border border-amber-600 text-amber-800 hover:bg-amber-50 px-10 py-4 font-light tracking-wide transition-colors"
              >
                Notre Histoire
              </motion.button>
            </Link>
          </motion.div>

          {/* Stats */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.7 }}
            className="relative"
          >
            {/* Decorative line */}
            <div className="flex items-center justify-center mb-12">
              <div className="h-px flex-1 max-w-xs bg-gradient-to-r from-transparent via-amber-300 to-transparent" />
            </div>

            <div className="grid grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8 max-w-5xl mx-auto">
              {[
                { value: '1,000+', label: 'Clients Satisfaits' },
                { value: '5,000+', label: 'Sacs Créés' },
                { value: '29+', label: 'Années d\'Excellence' },
                { value: '200+', label: 'Modèles Uniques' }
              ].map((stat, index) => (
                <motion.div
                  key={index}
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ duration: 0.6, delay: 0.8 + index * 0.1 }}
                  whileHover={{ y: -8 }}
                  className="group relative"
                >
                  {/* Card background */}
                  <div className="relative overflow-hidden bg-white/80 backdrop-blur-sm border border-amber-200/30 p-8 transition-all duration-500 group-hover:border-amber-400/50 group-hover:shadow-lg">
                    {/* Gradient overlay on hover */}
                    <div className="absolute inset-0 bg-gradient-to-br from-amber-50/50 via-white to-orange-50/30 opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
                    
                    {/* Decorative corner accent */}
                    <div className="absolute top-0 right-0 w-16 h-16 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
                      <div className="absolute top-0 right-0 w-full h-px bg-gradient-to-l from-amber-400 to-transparent" />
                      <div className="absolute top-0 right-0 w-px h-full bg-gradient-to-b from-amber-400 to-transparent" />
                    </div>

                    <div className="relative text-center">
                      <div className="text-4xl lg:text-5xl font-light text-amber-800 mb-3 tracking-tight group-hover:text-amber-900 transition-colors duration-300">
                        {stat.value}
                      </div>
                      <div className="text-xs lg:text-sm text-gray-600 font-light tracking-[0.15em] uppercase">
                        {stat.label}
                      </div>
                    </div>
                  </div>
                </motion.div>
              ))}
            </div>

            {/* Bottom decorative line */}
            <div className="flex items-center justify-center mt-12">
              <div className="h-px flex-1 max-w-xs bg-gradient-to-r from-transparent via-amber-300 to-transparent" />
            </div>
          </motion.div>
        </motion.div>
      </div>
    </section>
  );
};

export default Hero;