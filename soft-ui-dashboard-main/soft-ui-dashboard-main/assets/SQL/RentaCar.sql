DROP DATABASE rentacar; 

CREATE database rentacar;
USE rentacar;


CREATE TABLE `rol` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(50) NOT NULL
);

Insert into rol (id, name) values (1, 'Admin');
Insert into rol (id, name) values (2, 'Cliente');

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `rol_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  Foreign Key (rol_id) REFERENCES rol(id)
);

INSERT INTO usuarios (rol_id, name, email, password) VALUES (2, 'John Doe', 'johndoe@example.com', 'password123');

CREATE TABLE `estado` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(50) NOT NULL
);

Insert into estado (id, name) values (1, 'Available');
Insert into estado (id, name) values (2, 'Rented');

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `estado_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,

  Foreign Key (estado_id) REFERENCES estado(id)

);

INSERT INTO VEHICULO (ESTADO_ID, NAME, DESCRIPTION, IMAGE, STOCK, PRICE) VALUES 
	(1, 'Hyundai Creta','Comfortable to move through the city.','../assets/img/creata_limited.jpg',1,500),
    (1, 'Suzuki XL7','Spacious and affordable for a big family.','../assets/img/suzuki-xl7-2022-white-dc94.jpg',1,1000),
    (1, 'Suzuki Baleno','Small and comfortable for a single person.','../assets/img/suzuki-baleno-front-quarter-2.jpg',1,1000);

UPDATE VEHICULO SET IMAGE = '../assets/img/creata_limited.jpg' WHERE ID = 1; 

SELECT * FROM VEHICULO; 

DROP TABLE RESERVA; 

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `usuario_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `total` int(11) NOT NULL,

  Foreign Key (usuario_id) REFERENCES usuarios(id),
  Foreign Key (vehiculo_id) REFERENCES vehiculo(id)
);

INSERT INTO reserva (usuario_id, vehiculo_id, fecha_reserva, fecha_entrega, fecha_devolucion, total)
VALUES (1, 2, '2024-05-01', '2024-05-05', '2024-05-10', 1500);

UPDATE VEHICULO SET ESTADO_ID = 2 WHERE ID = 2;

DELIMITER $$
CREATE PROCEDURE ValidarUsuario (
	IN userEmail VARCHAR(100), 
	IN userPassword VARCHAR(100) 
)
BEGIN 
  SELECT * FROM usuarios WHERE email = userEmail AND password = userPassword; 
END $$

DELIMITER ; 

CALL ValidarUsuario('johndoe@example.com', 'password123')

DELIMITER $$
CREATE PROCEDURE CrearUsuario (
	IN userName VARCHAR(100),
    IN userEmail VARCHAR(100), 
	IN userPassword VARCHAR(100),
    IN userRole INT
)
BEGIN 
  
  INSERT INTO usuarios (rol_id, name, email, password) VALUES (userRole, userName, userEmail, userPassword);

END $$

DELIMITER ; 

CALL CrearUsuario('Jane Doe', 'jane@example.com', 'password456', 1);

SELECT * FROM USUARIOS; 

DELIMITER $$
CREATE PROCEDURE OptenerVehiculoUsuario (
	IN userID INT
)
BEGIN 

	SELECT 
		*
	FROM RESERVA R
	INNER JOIN VEHICULO V ON V.ID = R.VEHICULO_ID
	WHERE USUARIO_ID = userID;

END $$

DELIMITER ; 

CALL OptenerVehiculoUsuario(1);

DROP PROCEDURE OptenerVehiculos; 

DELIMITER $$
CREATE PROCEDURE OptenerVehiculos ()
BEGIN 

	SELECT 
		v.id,
		v.name,
        v.description,
        v.image,
        v.stock,
        v.price,
        e.name as estado
	FROM VEHICULO V
	INNER JOIN ESTADO E ON E.ID = V.ESTADO_ID;

END $$

DELIMITER ; 

CALL OptenerVehiculos; 

SELECT * FROM RESERVA;

DROP PROCEDURE CrearReserva; 

DELIMITER $$
CREATE PROCEDURE CrearReserva (
	IN userID INT,
    IN vehiculo_id INT, 
	IN fecha_entrega DATE,
    IN fecha_devolución DATE
)
BEGIN 
	
	DECLARE vehicle_price INT;
    DECLARE total_price INT;
    DECLARE days_diff INT;
    
    SELECT price INTO vehicle_price FROM vehiculo WHERE id = vehiculo_id;
    SET days_diff = DATEDIFF(fecha_devolucion, fecha_entrega);
    SET total_price = days_diff * vehicle_price;
    
	INSERT INTO reserva (usuario_id, vehiculo_id, fecha_reserva, fecha_entrega, fecha_devolucion, total)
	VALUES (userID, vehiculo_id, NOW(), fecha_entrega, fecha_devolucion, total_price);
    
    UPDATE VEHICULO SET ESTADO_ID = 2 WHERE ID = vehiculo_id;

END $$

DELIMITER ; 

CALL CrearReserva(2, 1, '2024-05-01', '2024-05-10');



