const { pool } = require("./db");

async function insertData() {
	const [name, color] = process.argv.slice(2);
	try {
		const res = await pool.query(
			"INSERT INTO shark (name, color) VALUES ($1, $2)",
			[name, color]
		);
		console.log(`Added a shark with the name ${name}`);
	} catch (error) {
		console.error(error)
	}
}

async function retrieveData() {
	try {
		const res = await pool.query("SELECT * FROM shark");
		console.log(res.rows);
	} catch (error) {
		console.error(error);
	}
}

async function modifyData() {
	const [id, name] = process.argv.slice(2);
	try {
		const res = await pool.query("UPDATE shark SET name = $1 WHERE id = $2", [
			name,
			id,
		]);
		console.log(`Updated the shark name to ${name}`);
	} catch (error) {
		console.error(error);
	}
}