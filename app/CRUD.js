const { pool } = require("./db");

async function insertData() {
	const [name, color] = process.argv.slice(2);
	try {
		const res = await pool.query(
			"INSERT INTO table (field1, field2) VALUES ($1, $2)",
			[name, color]
		);
		console.log(`Added`);
	} catch (error) {
		console.error(error)
	}
}

async function retrieveData() {
	try {
		const res = await pool.query("SELECT * FROM table");
		console.log(res.rows);
	} catch (error) {
		console.error(error);
	}
}

async function modifyData() {
	const [id, name] = process.argv.slice(2);
	try {
		const res = await pool.query("UPDATE table SET name = $1 WHERE id = $2", [
			name,
			id,
		]);
		console.log(`Updated`);
	} catch (error) {
		console.error(error);
	}
}