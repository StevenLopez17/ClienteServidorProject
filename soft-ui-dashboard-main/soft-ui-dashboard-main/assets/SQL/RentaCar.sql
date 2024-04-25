CREATE database rentacar;
USE rentacar;


CREATE TABLE `rol` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(50) NOT NULL
);

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL primary key,
  `rol_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  Foreign Key (rol_id) REFERENCES rol(id)
);


CREATE TABLE `estado` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(50) NOT NULL
);

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL primary key,
  `estado_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,

  Foreign Key (estado_id) REFERENCES estado(id)

);


CREATE TABLE `reserva` (
  `id` int(11) NOT NULL primary key,
  `usuario_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `total` int(11) NOT NULL,

  Foreign Key (usuario_id) REFERENCES usuarios(id),
  Foreign Key (vehiculo_id) REFERENCES vehiculo(id)
);





