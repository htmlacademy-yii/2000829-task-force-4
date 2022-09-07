CREATE DATABASE taskforse
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE taskforse;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(128) NOT NULL,
  password CHAR(64) NOT NULL,
  is_implementer TINYINT(1) DEFAULT (0),
  avatar_path CHAR(255) NULL,
  birthday TIMESTAMP DEFAULT NULL,
  phone CHAR(11) NULL,
  telegram varchar(64) NULL,
  information TEXT,
  raiting DECIMAL DEFAULT NULL,
  city_id INT,
  FOREIGN KEY (city_id) REFERENCES city (id)
);

CREATE TABLE city (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(255) NOT NULL UNIQUE,
  longitude decimal(11,8) NOT NULL,
  latitude decimal(11,8) NOT NULL
);

CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR (64) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  file VARCHAR(255),
  deadline_at DATE NULL,
  budget INT NOT NULL,
  user_id INT,
  category_id INT,
  city_id INT,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id),
  FOREIGN KEY (city_id) REFERENCES city (id)
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE speciality (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  category_id INT,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE response (
  id INT AUTO_INCREMENT PRIMARY KEY,
  implementer_id INT,
  task_id INT,
  price INT NULL,
  comment VARCHAR(255) NULL,
  FOREIGN KEY (implementer_id) REFERENCES users (id),
  FOREIGN KEY (task_id) REFERENCES tasks (id)
);

CREATE TABLE feedback (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT,
  rate TINYINT(5) NOT NULL,
  comment VARCHAR(255) NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks (id)
);
