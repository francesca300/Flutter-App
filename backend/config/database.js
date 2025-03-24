import mysql from "mysql2";


//create connection to the database

const db= mysql.createConnection({
    host: "localhost",
    user:"root",
    password:"",
    database:"last"
});

export default db;