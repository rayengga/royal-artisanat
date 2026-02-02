import { PrismaClient } from '@prisma/client';

const localDB = process.env.LOCAL_DATABASE_URL!;
const neonDB = process.env.NEON_DATABASE_URL!;

async function exportToNeon() {
  console.log('🔄 Connecting to local database...');
  const local = new PrismaClient({ datasourceUrl: localDB });
  
  try {
    const categories = await local.$queryRaw`SELECT * FROM categories`;
    const products = await local.$queryRaw`SELECT * FROM products`;
    const images = await local.$queryRaw`SELECT * FROM images`;
    const users = await local.$queryRaw`SELECT * FROM users`;
    
    console.log(`📊 Found: ${(categories as any[]).length} categories, ${(products as any[]).length} products, ${(images as any[]).length} images, ${(users as any[]).length} users`);
    
    await local.$disconnect();
    
    console.log('🔄 Connecting to Neon...');
    const neon = new PrismaClient({ datasourceUrl: neonDB });
    
    // Clear existing data first
    console.log('🗑️  Clearing existing data...');
    await neon.$executeRaw`DELETE FROM images`;
    await neon.$executeRaw`DELETE FROM order_items`;
    await neon.$executeRaw`DELETE FROM orders`;
    await neon.$executeRaw`DELETE FROM products`;
    await neon.$executeRaw`DELETE FROM categories`;
    await neon.$executeRaw`DELETE FROM users`;
    
    // Import data
    console.log('📤 Importing categories...');
    for (const cat of categories as any[]) {
      const createdAt = cat.created_at || new Date();
      const updatedAt = cat.updated_at || new Date();
      await neon.$executeRaw`INSERT INTO categories (id, name, description, "createdAt", "updatedAt") VALUES (${cat.id}, ${cat.name}, ${cat.description}, ${createdAt}, ${updatedAt})`;
    }
    console.log(`✅ Imported ${(categories as any[]).length} categories`);
    
    console.log('📤 Importing users...');
    for (const user of users as any[]) {
      const createdAt = user.createdAt || new Date();
      const updatedAt = user.updatedAt || new Date();
      await neon.$executeRaw`INSERT INTO users (id, email, password, "firstName", "lastName", role, "createdAt", "updatedAt") VALUES (${user.id}, ${user.email}, ${user.password}, ${user.firstName}, ${user.lastName}, ${user.role}::"UserRole", ${createdAt}, ${updatedAt})`;
    }
    console.log(`✅ Imported ${(users as any[]).length} users`);
    
    console.log('📤 Importing products...');
    for (const prod of products as any[]) {
      const createdAt = prod.createdAt || new Date();
      const updatedAt = prod.updatedAt || new Date();
      const isActive = prod.isActive !== undefined ? prod.isActive : true;
      await neon.$executeRaw`INSERT INTO products (id, name, description, price, stock, "categoryId", "isActive", "createdAt", "updatedAt") VALUES (${prod.id}, ${prod.name}, ${prod.description}, ${prod.price}, ${prod.stock}, ${prod.categoryId}, ${isActive}, ${createdAt}, ${updatedAt})`;
    }
    console.log(`✅ Imported ${(products as any[]).length} products`);
    
    console.log('📤 Importing images...');
    for (const img of images as any[]) {
      const createdAt = img.createdAt || new Date();
      await neon.$executeRaw`INSERT INTO images (id, url, alt, "productId", "createdAt") VALUES (${img.id}, ${img.url}, ${img.alt}, ${img.productId}, ${createdAt})`;
    }
    console.log(`✅ Imported ${(images as any[]).length} images`);
    
    console.log('🎉 Export completed successfully!');
    await neon.$disconnect();
  } catch (error) {
    console.error('❌ Error:', error);
    await local.$disconnect();
  }
}

exportToNeon();
