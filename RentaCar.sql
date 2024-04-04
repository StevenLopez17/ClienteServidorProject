CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `principal` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

INSERT INTO `stock` (`id`, `name`, `description`, `image`, `principal`) VALUES
(1, 'Vehiculo Automovil', 'Vehiculo Automovil de 4 puertas.', 'images/automovil.jpg', 1),
(2, 'Vehiculo Lujo', 'Vehiculo Lujo de 4 puertas motor 4000.', 'images/Lujo.jpg', 1),
(3, 'Vehiculo 4x4', 'Vehiculo 4x4', 'images/4x4.jpg', 1);



CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `personas` (`id`, `name`, `description`, `image`) VALUES
(1, 'Alfredo Garita', 'Nuestro manager principal', 'images/alfredo.jpg'),
(2, 'Maria Tencio', 'Vicepresidente del RentaCar Pilot', 'images/maria.jpg');

ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;