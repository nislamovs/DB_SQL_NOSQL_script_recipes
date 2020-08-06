CREATE DATABASE IF NOT EXISTS cinema_booking_system;
USE cinema_booking_system;

CREATE TABLE IF NOT EXISTS reserved_seat (

	id INT PRIMARY KEY AUTO_INCREMENT,
	booking_id INT NOT NULL,
	seat_id INT NOT NULL,
	FOREIGN KEY (booking_id) REFERENCES bookings(id),
	FOREIGN KEY (seat_id) REFERENCES seats(id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;