//import connection
import db from "../config/database.js";

//get all products
export const getUser = (result) => {
  db.query("SELECT * FROM users", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};

//get single product
export const getUserById = (id, result) => {
  db.query(
    "SELECT * FROM users WHERE id = ?",
    [id],
    (err, results) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, results[0]);
      }
    }
  );
};

//insert product to database
export const insertUser = (data, result) => {
  db.query("INSERT INTO users SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};

export const updateUserById = (data, id, result) => {
  db.query(
    "UPDATE users SET username = ?, major = ?, email = ? WHERE id = ?",
    [data.username, data.major, data.email, id], // Correct parameters
    (err, results) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, results);
      }
    }
  );
};

    
// Delete Product to Database
export const deleteUserById = (id, result) => {
  db.query("DELETE FROM users WHERE id = ?", [id], (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
