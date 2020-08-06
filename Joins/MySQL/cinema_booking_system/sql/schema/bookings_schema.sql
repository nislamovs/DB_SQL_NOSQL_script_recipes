CREATE DATABASE IF NOT EXISTS cinema_booking_system;
USE cinema_booking_system;

CREATE TABLE IF NOT EXISTS bookings (

	id INT PRIMARY KEY AUTO_INCREMENT,
	screening_id INT NOT NULL,
	customer_id INT NOT NULL,
	FOREIGN KEY (screening_id) REFERENCES screenings(id),
	FOREIGN KEY (customer_id) REFERENCES customers(id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;