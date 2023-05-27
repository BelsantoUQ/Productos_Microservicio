START TRANSACTION;
USE productos_microservicio;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `estado_producto` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `productos` (`id_producto`, `referencia`, `nombre`, `precio`, `descripcion`, `marca`, `categoria`, `imagen_url`, `stock`, `estado_producto`) VALUES
(1, 'PROD001', 'Camiseta', '20.99', 'Camiseta de algodón con diseño estampado', 'Adidas', 'Ropa', 'https://imagenurl.com/camiseta-adidas.jpg', 10, 'I'),
(2, 'PROD002', 'Zapatillas', '59.99', 'Zapatillas deportivas con suela de goma', 'Nike', 'Calzado', 'https://imagenurl.com/zapatillas-nike.jpg', 5, 'I'),
(3, 'PROD003', 'Pantalones', '35.99', 'Pantalones vaqueros de corte recto', 'Levis', 'Ropa', 'https://imagenurl.com/pantalones-levis.jpg', 20, 'I');

COMMIT;
