CREATE TABLE User ( 
userid INT PRIMARY KEY, 
name VARCHAR(100), 
pin VARCHAR(20), 
address_line1 VARCHAR(255), 
address_line2 VARCHAR(255), 
country VARCHAR(100), 
city VARCHAR(100), 
state VARCHAR(100) 
); 
CREATE TABLE Email ( 
email VARCHAR(255) PRIMARY KEY, 
userid INT, 
FOREIGN KEY (userid) REFERENCES User(userid) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Payment ( 
paymentid INT PRIMARY KEY, 
amount DECIMAL(10,2), 
payment_method VARCHAR(50), 
status VARCHAR(50), 
userid INT, 
FOREIGN KEY (userid) REFERENCES User(userid) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Feedback ( 
feedback_id INT PRIMARY KEY, 
rating INT CHECK (rating BETWEEN 1 AND 5), 
comments TEXT, 
userid INT, 
FOREIGN KEY (userid) REFERENCES User(userid) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Send ( 
sender_id INT, 
receiver_id INT, 
package_id INT, 
PRIMARY KEY (sender_id, receiver_id, package_id), 
FOREIGN KEY (sender_id) REFERENCES User(userid) 
ON UPDATE CASCADE ON DELETE CASCADE, 
FOREIGN KEY (receiver_id) REFERENCES User(userid) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Package ( 
package_id INT PRIMARY KEY, 
status VARCHAR(50), 
weight DECIMAL(10,2), 
dimension VARCHAR(50), 
pickup_address VARCHAR(255), 
shipment_id INT, 
FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Shipment ( 
shipment_id INT PRIMARY KEY, 
pickup_time TIMESTAMP, 
status VARCHAR(50), 
delivery_time TIMESTAMP, 
vehicle_id INT, 
driver_id INT, 
FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id) ON UPDATE CASCADE ON 
DELETE CASCADE, 
FOREIGN KEY (driver_id) REFERENCES Driver(driver_id) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Tracking ( 
tracking_id INT PRIMARY KEY, 
current_location VARCHAR(255), 
time_stamp TIMESTAMP, 
status VARCHAR(50), 
shipment_id INT, 
FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
CREATE TABLE Vehicle ( 
vehicle_id INT PRIMARY KEY, 
vehicle_type VARCHAR(50), 
capacity DECIMAL(10,2), 
status VARCHAR(50) 
); 
CREATE TABLE Driver ( 
driver_id INT PRIMARY KEY, 
phone_no VARCHAR(20), 
license_number VARCHAR(50), 
status VARCHAR(50), 
vehicle_id INT, 
FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id) 
ON UPDATE CASCADE ON DELETE CASCADE 
); 
