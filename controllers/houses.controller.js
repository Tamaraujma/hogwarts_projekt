import { pool } from "../db.js";

export const getAllHouses = async (req, res) => {
  try {
    const allHouses = await housesRepository.getAllHouses();
    res.json(allHouses);
  } catch (err) {
    console.error(err);
    res.status(500).send("Database error");
  }
};

export async function getSingleHouse(req, res) {
  try {
    const id = req.params.id;
    const house = await houseRepository.getHouseById(id);

    if (house) {
      res.status(200).json(house);
    } else {
      res.status(404);
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Database error" });
  }
}
