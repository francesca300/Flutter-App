//import functions from Product model
import {
    getUser,
    getUserById,
    insertUser,
    updateUserById,
    deleteUserById,
  } from "../models/userModel.js";
  
  //get all products
  export const showUser = (req, res) => {
    getUser((err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };
  
  //get single product
  export const showUserById = (req, res) => {
    getUserById(req.params.id, (err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };
  
  //create new product
  export const createUser = (req, res) => {
    const data = req.body;
    insertUser(data, (err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };
  
  // Update Product
  export const updateUser = (req, res) => {
    const data = req.body;
    const id = req.params.id;
    updateUserById(data, id, (err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };
  
  // Delete Product
  export const deleteUser = (req, res) => {
    const id = req.params.id;
    deleteUserById(id, (err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };
  