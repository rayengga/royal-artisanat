'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import { ShoppingCart, User, Menu, X } from 'lucide-react';
import { useCart } from '@/context/CartContext';
import { useAuth } from '@/context/AuthContext';

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const { cart } = useCart();
  const { isAuthenticated, user, logout } = useAuth();

  const navItems = [
    { name: 'Home', href: '/' },
    { name: 'Shop', href: '/shop' },
    { name: 'About', href: '/about' },
    { name: 'Contact', href: '/contact' },
  ];

  const toggleMenu = () => setIsMenuOpen(!isMenuOpen);

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-pure-white/95 backdrop-blur-md border-b border-light-brown/20 card-shadow">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <Link href="/" className="flex items-center space-x-4 group">
            <motion.div 
              className="relative"
              whileHover={{ scale: 1.05 }}
              transition={{ duration: 0.3, ease: "easeOut" }}
            >
              <img 
                src="/logo.svg" 
                alt="Royal Artisans Logo" 
                className="h-10 w-auto"
              />
            </motion.div>
            
            {/* Creative "DECORY" Text */}
            <motion.div 
              className="relative"
              whileHover={{ scale: 1.05 }}
              transition={{ duration: 0.3 }}
            >
              {/* Main Text with Individual Letter Animation */}
              <motion.div className="flex items-center gap-1">
                <motion.div className="flex">
                  {['R', 'O', 'Y', 'A', 'L'].map((letter, index) => (
                    <motion.span
                      key={index}
                      className="text-2xl font-serif relative"
                      style={{
                        background: 'linear-gradient(135deg, #92400e 0%, #d97706 50%, #92400e 100%)',
                        backgroundClip: 'text',
                        WebkitBackgroundClip: 'text',
                        color: 'transparent',
                        fontWeight: 700,
                        letterSpacing: '0.08em'
                      }}
                      whileHover={{ 
                        scale: 1.1,
                        y: -2
                      }}
                      transition={{ 
                        duration: 0.3,
                        delay: index * 0.05
                      }}
                    >
                      {letter}
                    </motion.span>
                  ))}
                </motion.div>
                <span className="text-base text-amber-800/60 mx-2 font-light">•</span>
                <motion.span className="text-base font-serif text-amber-900/80 tracking-wide" style={{ fontStyle: 'italic' }}>
                  Artisanat
                </motion.span>
              </motion.div>
              
              {/* Animated Underline */}
              <motion.div 
                className="absolute -bottom-1 left-0 h-0.5 bg-gradient-to-r from-amber-700 via-amber-500 to-amber-700 rounded-full"
                initial={{ width: 0 }}
                whileHover={{ width: '100%' }}
                transition={{ duration: 0.5, ease: "easeOut" }}
              />
            </motion.div>
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            {navItems.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className="nav-link text-dark-gray font-medium"
              >
                {item.name}
              </Link>
            ))}
          </div>

          {/* Right side icons */}
          <div className="flex items-center space-x-4">
            {/* Cart */}
            <Link href="/cart" className="relative p-2 hover:bg-warm-beige rounded-full transition-colors duration-300 text-dark-gray hover:text-electric-blue">
              <ShoppingCart className="w-5 h-5" />
              {cart.itemCount > 0 && (
                <motion.span
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  className="absolute -top-1 -right-1 bg-soft-gold text-dark-gray text-xs rounded-full w-5 h-5 flex items-center justify-center font-semibold gold-glow"
                >
                  {cart.itemCount}
                </motion.span>
              )}
            </Link>

            {/* User menu */}
            <div className="relative">
              {isAuthenticated ? (
                <div className="flex items-center space-x-2">
                  {/* Admin Dashboard Link */}
                  {user?.role === 'ADMIN' && (
                    <Link
                      href="/admin"
                      className="hidden sm:flex items-center px-3 py-1.5 bg-gradient-to-r from-soft-gold/20 to-electric-blue/20 border border-soft-gold/30 rounded-lg text-sm font-medium text-soft-gold hover:from-soft-gold/30 hover:to-electric-blue/30 transition-all duration-300"
                    >
                      Admin
                    </Link>
                  )}
                  <span className="hidden sm:block text-sm text-medium-gray">
                    Welcome, {user?.name?.split(' ')[0] || user?.name}
                  </span>
                  <Link
                    href="/profile"
                    className="p-2 hover:bg-warm-beige rounded-full transition-colors duration-300 text-dark-gray hover:text-electric-blue"
                    title="Profile"
                  >
                    <User className="w-5 h-5" />
                  </Link>
                  <button
                    onClick={logout}
                    className="hidden sm:flex p-2 hover:bg-warm-beige rounded-full transition-colors duration-300 text-dark-gray hover:text-red-400"
                    title="Logout"
                  >
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                    </svg>
                  </button>
                </div>
              ) : (
                <Link 
                  href="/login" 
                  className="p-2 hover:bg-warm-beige rounded-full transition-colors duration-300 text-dark-gray hover:text-electric-blue"
                >
                  <User className="w-5 h-5" />
                </Link>
              )}
            </div>

            {/* Mobile menu button */}
            <button
              onClick={toggleMenu}
              className="md:hidden p-2 hover:bg-warm-beige rounded-full transition-colors duration-300 text-dark-gray"
            >
              {isMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
            </button>
          </div>
        </div>

        {/* Clean Mobile menu */}
        <AnimatePresence>
          {isMenuOpen && (
            <motion.div
              initial={{ opacity: 0, height: 0 }}
              animate={{ opacity: 1, height: 'auto' }}
              exit={{ opacity: 0, height: 0 }}
              transition={{ duration: 0.3 }}
              className="md:hidden border-t border-light-brown/20"
            >
              <div className="py-4 space-y-4">
                {navItems.map((item, index) => (
                  <motion.div
                    key={item.name}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: index * 0.1 }}
                  >
                    <Link
                      href={item.href}
                      className="block px-4 py-2 text-dark-gray hover:text-electric-blue hover:bg-warm-beige rounded-lg transition-all duration-300 font-medium"
                      onClick={() => setIsMenuOpen(false)}
                    >
                      {item.name}
                    </Link>
                  </motion.div>
                ))}
                
                {/* Auth-specific links for mobile */}
                {isAuthenticated ? (
                  <>
                    {/* Admin link for mobile */}
                    {user?.role === 'ADMIN' && (
                      <motion.div
                        initial={{ opacity: 0, x: -20 }}
                        animate={{ opacity: 1, x: 0 }}
                        transition={{ delay: navItems.length * 0.1 }}
                      >
                        <Link
                          href="/admin"
                          className="block px-4 py-2 bg-gradient-to-r from-soft-gold/20 to-electric-blue/20 border border-soft-gold/30 rounded-lg text-soft-gold hover:from-soft-gold/30 hover:to-electric-blue/30 transition-all duration-300 font-medium"
                          onClick={() => setIsMenuOpen(false)}
                        >
                          Admin Dashboard
                        </Link>
                      </motion.div>
                    )}
                    
                    {/* Profile link for mobile */}
                    <motion.div
                      initial={{ opacity: 0, x: -20 }}
                      animate={{ opacity: 1, x: 0 }}
                      transition={{ delay: (navItems.length + 1) * 0.1 }}
                    >
                      <Link
                        href="/profile"
                        className="block px-4 py-2 text-dark-gray hover:text-electric-blue hover:bg-warm-beige rounded-lg transition-all duration-300 font-medium"
                        onClick={() => setIsMenuOpen(false)}
                      >
                        My Profile
                      </Link>
                    </motion.div>
                    
                    {/* Logout button for mobile */}
                    <motion.div
                      initial={{ opacity: 0, x: -20 }}
                      animate={{ opacity: 1, x: 0 }}
                      transition={{ delay: (navItems.length + 2) * 0.1 }}
                    >
                      <button
                        onClick={() => {
                          logout();
                          setIsMenuOpen(false);
                        }}
                        className="block w-full text-left px-4 py-2 text-red-400 hover:text-red-300 hover:bg-red-400/10 rounded-lg transition-all duration-300 font-medium"
                      >
                        Logout
                      </button>
                    </motion.div>
                  </>
                ) : (
                  <motion.div
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: navItems.length * 0.1 }}
                  >
                    <Link
                      href="/login"
                      className="block px-4 py-2 text-dark-gray hover:text-electric-blue hover:bg-warm-beige rounded-lg transition-all duration-300 font-medium"
                      onClick={() => setIsMenuOpen(false)}
                    >
                      Login
                    </Link>
                  </motion.div>
                )}
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </nav>
  );
};

export default Navbar;