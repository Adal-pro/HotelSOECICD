
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombrec` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `categorias` (`id`, `nombrec`, `descripcion`) VALUES
(1, 'Suite normal', 'Habitación sin decoración '),
(2, 'Suite ejecutivo', 'habitacion especial'),
(3, 'Master Suite', 'habitacion completa'),
(5, 'Suite familiar ', 'habitacion epsecial para familias con 2 hijos');


CREATE TABLE `detallecategoria` (
  `idcategoria` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `detallecategoria` (`idcategoria`, `idopcion`) VALUES
(1, 2),
(1, 3),
(1, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

-- --------------------------------------------------------



CREATE TABLE `habitaciones` (
  `id` int(11) NOT NULL,
  `nrohabitacion` int(11) NOT NULL,
  `estado` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_h` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `habitaciones` (`id`, `nrohabitacion`, `estado`, `descripcion`, `fecha_h`, `id_categoria`) VALUES
(1, 1, 'Disponible', '50$ 1dia 1 noche', '2021-01-22 20:06:21', 1),
(2, 2, 'Disponible', '100$ 1dia 1 noche', '2021-01-22 20:06:49', 2),
(3, 3, 'Disponible', '200$ 1dia ', '2021-01-22 20:20:06', 3),
(4, 4, 'Disponible', '380$ 1dia ', '2021-03-25 00:52:40', 2);


CREATE TABLE `opcion` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `opcion` (`id`, `nombre`, `fecha`) VALUES
(1, 'aire acondicionado', '2021-01-22 19:54:23'),
(2, 'baño privado', '2021-01-22 19:54:36'),
(3, 'tv x cable', '2021-01-22 19:54:48'),
(4, 'wifi ', '2021-01-22 19:54:57'),
(5, 'cama de 2 plazas', '2021-01-22 19:55:19'),
(6, 'frigo bar', '2021-01-22 19:55:36'),
(7, 'cama de 3 plazas', '2021-01-22 19:55:47'),
(8, 'calefacción', '2021-01-22 19:56:18'),
(11, 'Bar para 2 personas', '2021-01-24 13:34:20');



CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion_reserva` text NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `reservas` (`id_reserva`, `id_habitacion`, `id_usuario`, `descripcion_reserva`, `fecha_ingreso`, `fecha_salida`, `fecha_reserva`) VALUES
(1, 1, 1, 'cliente solicita garaje para su vehiculo ', '2021-01-23', '2021-01-26', '2021-01-22 20:21:11'),
(2, 2, 2, 'cliente con estadia corta', '2021-01-30', '2021-01-31', '2021-01-22 20:22:12'),
(3, 3, 4, 'cliente pagara cuando llegue al hotel', '2021-01-28', '2021-01-30', '2021-01-22 20:24:05'),
(4, 4, 1, 'cliente solicita la sala de juntas', '2021-01-29', '2021-01-30', '2021-01-24 13:39:22'),
(5, 3, 1, 'Descripcion test 2023', '2023-05-07', '2023-05-14', '2023-05-07 15:36:47');



CREATE TABLE `usuarios` (
  `id_u` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `ci` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `usuarios` (`id_u`, `nombre`, `email`, `ci`, `telefono`, `fecha`) VALUES
(1, 'Adalberto', 'adal85@outlook.com', 784523, 846662, '2021-01-22 16:31:33'),
(2, 'Eugenia', 'ficctpack2018@gmail.com', 899985, 786897, '2021-01-22 16:31:57'),
(4, 'Carla', 'carla@gmail.com', 322122, 786897, '2021-01-22 16:33:16');


ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `detallecategoria`
  ADD PRIMARY KEY (`idcategoria`,`idopcion`),
  ADD KEY `idopcion` (`idopcion`);


ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);


ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`);


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_u`);


ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `habitaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `opcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `usuarios`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `detallecategoria`
  ADD CONSTRAINT `detallecategoria_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detallecategoria_ibfk_2` FOREIGN KEY (`idopcion`) REFERENCES `opcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

