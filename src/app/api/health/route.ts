import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

export async function GET() {
  try {
    // Test database connection
    await prisma.$connect()
    
    // Try to count products
    const productCount = await prisma.product.count()
    const categoryCount = await prisma.category.count()
    
    return NextResponse.json({
      status: 'ok',
      database: 'connected',
      productCount,
      categoryCount,
      timestamp: new Date().toISOString()
    })
  } catch (error: any) {
    console.error('Health check error:', error)
    return NextResponse.json(
      { 
        status: 'error',
        database: 'disconnected',
        error: error.message,
        timestamp: new Date().toISOString()
      },
      { status: 500 }
    )
  } finally {
    await prisma.$disconnect()
  }
}