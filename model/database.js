const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const saltRounds = 12; 

const connection = mysql.createConnection({
  host: process.env.SQL_HOST,
  user: process.env.SQL_USER,
  password: process.env.SQL_PASSWORD,
  database: process.env.DB_NAME
});

const createUserTableQuery = `CREATE TABLE IF NOT EXISTS users (
                              user_id INT AUTO_INCREMENT PRIMARY KEY,
                                profile_picture VARCHAR(255) NOT NULL,
                                full_name VARCHAR(100) NOT NULL,
                                email VARCHAR(255) UNIQUE NOT NULL,
                                phone_number VARCHAR(13) NOT NULL,
                                password VARCHAR(255) NOT NULL
                              )`;

const adminQuery = `INSERT INTO users (profile_picture, full_name, email, phone_number, password) 
                    SELECT 'avatar-default.png', 'admin', 'admin@user.com', 09568492287, ?
                    WHERE NOT EXISTS (
                        SELECT 1 FROM users WHERE email = 'admin@user.com'
                    )`;

const adminPasswordHash = bcrypt.hashSync('admin123', saltRounds);  

connection.query(createUserTableQuery, (error) => {
  if (error) {
      console.log("Create table users failed: ", error);
      return;
  }
  console.log("Create table users successful or already exists");

  connection.query(adminQuery, [adminPasswordHash], (error) => {
      if (error) {
          console.log("Creating default admin user failed: ", error);
      }
      console.log("Default admin user successfully created or already exists");
  })
});

module.exports = connection;