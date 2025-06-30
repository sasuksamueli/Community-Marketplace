const mysql = require('mysql2/promise')

async function testAPIs() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'marketplace'
  })

  try {
    console.log('🔗 Connected to database')
    
    // Test locations query
    console.log('\n📍 Testing locations query...')
    try {
      const [locations] = await connection.query(`
        SELECT 
          id,
          name,
          type,
          latitude,
          longitude,
          is_active
        FROM locations
        WHERE is_active = TRUE
        ORDER BY name ASC
        LIMIT 5
      `)
      console.log('✅ Locations query successful:', locations.length, 'results')
      console.table(locations)
    } catch (error) {
      console.error('❌ Locations query failed:', error.message)
    }

    // Test categories query
    console.log('\n📂 Testing categories query...')
    try {
      const [categories] = await connection.query(`
        SELECT id, name, slug, description, icon
        FROM categories 
        WHERE is_active = TRUE 
        ORDER BY sort_order
        LIMIT 5
      `)
      console.log('✅ Categories query successful:', categories.length, 'results')
      console.table(categories)
    } catch (error) {
      console.error('❌ Categories query failed:', error.message)
    }

    // Test conditions query
    console.log('\n🔧 Testing conditions query...')
    try {
      const [conditions] = await connection.query(`
        SELECT id, name, description, sort_order
        FROM conditions 
        WHERE is_active = TRUE 
        ORDER BY sort_order
      `)
      console.log('✅ Conditions query successful:', conditions.length, 'results')
      console.table(conditions)
    } catch (error) {
      console.error('❌ Conditions query failed:', error.message)
    }

    // Test users query (session check)
    console.log('\n👤 Testing users query...')
    try {
      const [users] = await connection.query(`
        SELECT 
          id, username, email, first_name, last_name, phone, location, 
          bio, avatar_url, email_verified, status, created_at
        FROM users 
        WHERE status = 'active'
        LIMIT 3
      `)
      console.log('✅ Users query successful:', users.length, 'results')
      console.table(users.map(u => ({ id: u.id, username: u.username, email: u.email, status: u.status })))
    } catch (error) {
      console.error('❌ Users query failed:', error.message)
    }

  } catch (error) {
    console.error('❌ Database connection error:', error)
  } finally {
    await connection.end()
  }
}

testAPIs() 