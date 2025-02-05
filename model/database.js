const mysql = require('mysql2'); 

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'your_username',
    password: 'your_password',
    database: 'HOADB',
    port: 'your_port'
});

const createUserTableQuery = `CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    dp_img VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(13) NOT NULL,
    password VARCHAR(255) NOT NULL
)`;

const createAssetsTableQuery = `CREATE TABLE IF NOT EXISTS assets (
  asset_id INT(4) NOT NULL,
  asset_name VARCHAR(45) NOT NULL,
  asset_description VARCHAR(45) NOT NULL,
  acquisition_date DATE NOT NULL,
  forrent TINYINT(1) NOT NULL,
  asset_value DECIMAL(9,2) NOT NULL,
  type_asset ENUM('P', 'E', 'F', 'O') NOT NULL COMMENT 'P - Property\nE - Equipment\nF - F&F\nO - Others\n',
  status ENUM('W', 'D', 'P', 'S', 'X') NOT NULL COMMENT 'W - Working\nD - Deterioted\nP - For Repair\nS - For Disposal\nX - Disposed',
  loc_lattitude DECIMAL(7,4) NOT NULL,
  loc_longiture DECIMAL(7,4) NOT NULL,
  hoa_name VARCHAR(45) NOT NULL,
  enclosing_asset INT(4) NULL,
  PRIMARY KEY (asset_id),
  INDEX FKTYE05_idx (hoa_name ASC),
  INDEX FKTYE07_idx (enclosing_asset ASC),
  CONSTRAINT FKTYE05
    FOREIGN KEY (hoa_name)
    REFERENCES HOADB.hoa (hoa_name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FKTYE07
    FOREIGN KEY (enclosing_asset)
    REFERENCES HOADB.assets (asset_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)`;