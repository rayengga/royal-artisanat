import React from 'react';
import Hero from '@/components/ui/Hero';
import FeaturedProducts from '@/components/ui/FeaturedProducts';
import ShopByCategories from '@/components/ui/ShopByCategories';
import WhyChooseUs from '@/components/ui/WhyChooseUs';

export default function Home() {
  return (
    <div className="min-h-screen">
      <Hero />
      <FeaturedProducts />
      <WhyChooseUs />
      <ShopByCategories />
    </div>
  );
}
