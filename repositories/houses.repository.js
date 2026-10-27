import * as housesRepository from "../repositories/houses.repository.js";

export async function getAllHouses() {
  try {
    const result = await pool.query("SELECT * FROM houses");
    return json(allHouses);
  } catch (err) {
    console.error(err);
    res.status(500).send({ error: "Database error", code: err.code });
  }
}

export async function getHouseById(id) {
  const result = await pool.query("SELECT * FROM houses WHERE id = $1", [id]);

  if (one.rowCount === 0) {
  } else {
    return one.rows[0];
  }
}
