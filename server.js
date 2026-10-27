const express = require("express");

const server = express();

//require('dotenv').config();
import "dotenv/config";

// const express = import('express')
import express from "express";

//Database
// const { Pool } = require("pg");
import { Pool } from "pg";

const pool = new Pool({
  host: process.env.PG_HOST,
  port: process.env.PG_PORT,
  database: process.env.PG_DATABASE,
  user: process.env.PG_USER,
  password: process.env.PG_PASSWORD,
});
