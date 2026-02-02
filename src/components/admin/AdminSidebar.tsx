'use client';

import React from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { motion } from 'framer-motion';
import {
  LayoutDashboard,
  Package,
  ShoppingCart,
  Users,
  FolderOpen,
  BarChart3,
  Settings,
  Image as ImageIcon,
  Plus,
  LogOut
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';

const sidebarItems = [
  {
    name: 'Dashboard',
    href: '/admin',
    icon: LayoutDashboard,
  },
  {
    name: 'Products',
    href: '/admin/products',
    icon: Package,
    children: [
      { name: 'All Products', href: '/admin/products' },
      { name: 'Add Product', href: '/admin/products/add' },
    ]
  },
  {
    name: 'Categories',
    href: '/admin/categories',
    icon: FolderOpen,
    children: [
      { name: 'All Categories', href: '/admin/categories' },
      { name: 'Add Category', href: '/admin/categories/add' },
    ]
  },
  {
    name: 'Orders',
    href: '/admin/orders',
    icon: ShoppingCart,
  },
  {
    name: 'Clients',
    href: '/admin/clients',
    icon: Users,
  },
  {
    name: 'Images',
    href: '/admin/images',
    icon: ImageIcon,
  },
  {
    name: 'Statistics',
    href: '/admin/stats',
    icon: BarChart3,
  },
  {
    name: 'Settings',
    href: '/admin/settings',
    icon: Settings,
  },
];

export default function AdminSidebar() {
  const pathname = usePathname();
  const { logout } = useAuth();
  const [expandedItems, setExpandedItems] = React.useState<string[]>([]);

  const toggleExpanded = (itemName: string) => {
    setExpandedItems(prev => 
      prev.includes(itemName) 
        ? prev.filter(item => item !== itemName)
        : [...prev, itemName]
    );
  };

  return (
    <div className="fixed left-0 top-0 h-full w-64 bg-gray-800/90 backdrop-blur-md border-r border-gray-700/50 shadow-2xl">
      {/* Logo */}
      <div className="p-6 border-b border-gray-700/50">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="flex items-center space-x-3"
        >
          <div className="w-10 h-10 bg-gradient-to-r from-soft-gold to-electric-blue rounded-lg flex items-center justify-center">
            <span className="text-white font-bold text-lg">D</span>
          </div>
          <div>
            <h1 className="text-white font-bold text-xl">Decory</h1>
            <p className="text-gray-400 text-sm">Admin Panel</p>
          </div>
        </motion.div>
      </div>

      {/* Navigation */}
      <nav className="p-4 space-y-2">
        {sidebarItems.map((item, index) => (
          <div key={item.name}>
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.1 }}
            >
              {item.children ? (
                <button
                  onClick={() => toggleExpanded(item.name)}
                  className={`w-full flex items-center justify-between p-3 rounded-lg transition-all duration-200 ${
                    pathname.startsWith(item.href)
                      ? 'bg-gradient-to-r from-soft-gold/20 to-electric-blue/20 text-soft-gold border border-soft-gold/30'
                      : 'text-gray-300 hover:bg-gray-700/50 hover:text-white'
                  }`}
                >
                  <div className="flex items-center space-x-3">
                    <item.icon size={20} />
                    <span>{item.name}</span>
                  </div>
                  <Plus 
                    size={16} 
                    className={`transform transition-transform ${
                      expandedItems.includes(item.name) ? 'rotate-45' : ''
                    }`} 
                  />
                </button>
              ) : (
                <Link
                  href={item.href}
                  className={`flex items-center space-x-3 p-3 rounded-lg transition-all duration-200 ${
                    pathname === item.href
                      ? 'bg-gradient-to-r from-soft-gold/20 to-electric-blue/20 text-soft-gold border border-soft-gold/30'
                      : 'text-gray-300 hover:bg-gray-700/50 hover:text-white'
                  }`}
                >
                  <item.icon size={20} />
                  <span>{item.name}</span>
                </Link>
              )}
            </motion.div>

            {/* Submenu */}
            {item.children && expandedItems.includes(item.name) && (
              <motion.div
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: 'auto' }}
                exit={{ opacity: 0, height: 0 }}
                className="ml-6 mt-2 space-y-1"
              >
                {item.children.map((child) => (
                  <Link
                    key={child.name}
                    href={child.href}
                    className={`block p-2 pl-4 rounded-lg text-sm transition-all duration-200 ${
                      pathname === child.href
                        ? 'bg-soft-gold/10 text-soft-gold border-l-2 border-soft-gold'
                        : 'text-gray-400 hover:bg-gray-700/30 hover:text-white'
                    }`}
                  >
                    {child.name}
                  </Link>
                ))}
              </motion.div>
            )}
          </div>
        ))}
      </nav>

      {/* Logout */}
      <div className="absolute bottom-4 left-4 right-4">
        <button
          onClick={logout}
          className="w-full flex items-center space-x-3 p-3 rounded-lg text-gray-300 hover:bg-red-600/20 hover:text-red-400 transition-all duration-200"
        >
          <LogOut size={20} />
          <span>Logout</span>
        </button>
      </div>
    </div>
  );
}