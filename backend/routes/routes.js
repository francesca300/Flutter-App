//import express
import express from "express";

//import functions from controller
import {
  showUser,
  showUserById,
  createUser,
  updateUser,
  deleteUser,
} from "../controllers/user.js";

//init express router
const router = express.Router();

//get all product
router.get("/users", showUser);

//get single product
router.get("/users/:id", showUserById);

// Create New Product
router.post("/users", createUser);

// Update Product
router.put("/users/:id", updateUser);

// Delete Product
router.delete("/users/:id", deleteUser);

//export default router
export default router;
