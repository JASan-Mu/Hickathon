const { Pool } = require('pg')

const pool = new Pool({
	user: 'user',
	database: 'db',
	password: 'secure_pass',
	port: 5432,
	host: 'postgres',
})

module.exports = { pool };