import { pool } from "../db.js";

export async function getAllCourses() {
	const result = await pool.query("SELECT * FROM courses");
	return result.rows;
}

export async function getCourseById(id) {
	const result = await pool.query("SELECT * FROM courses WHERE id = $1", [id]);

	if (result.rowCount === 0) {
		return null;
	}

	return result.rows[0];
}

export async function createCourse(data) {
	const { name, teacher, students } = data;

	const result = await pool.query("INSERT INTO courses (name, teacher, students) VALUES ($1, $2, $3) RETURNING *", [name, teacher, students]);
	return result.rows[0];
}

export async function updateCourse(id, data) {
	const { name, teacher, students } = data;

	const result = await pool.query("UPDATE courses SET name = $1, teacher = $2, students = $3 WHERE id = $4 RETURNING *", [name, teacher, students, id]);

	if (result.rowCount === 0) {
		return null;
	}

	return result.rows[0];
}

export async function deleteCourse(id) {
	const result = await pool.query("DELETE FROM courses WHERE id = $1 RETURNING *", [id]);

	if (result.rowCount === 0) {
		return null;
	}

	return result.rows[0];
}
