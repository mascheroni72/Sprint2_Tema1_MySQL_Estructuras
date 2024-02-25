CREATE DATABASE IF NOT EXISTS Pizzeria;
USE Pizzeria;

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	primer_apellido VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	codigo_postal INT NOT NULL,
	localidad VARCHAR (45) NOT NULL,
	provincia VARCHAR (45),
	tel INT NOT NULL,
    PRIMARY KEY (id_cliente)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS pedidos (
	id_pedido INT NOT NULL,
	fecha_hora DATETIME,
	reparto_domicilio BIT,
	recogida_tienda BIT,
	cantidad_pizza INT,
	cantidad_hamburguesa INT,
	cantidad_bebida INT,
	preu_total FLOAT NOT NULL,
    clientes_id_cliente INT NOT NULL,
	PRIMARY KEY (id_pedido),
	CONSTRAINT fkpedidos_clientes 
    FOREIGN KEY (clientes_id_cliente)
	REFERENCES clientes (id_cliente)
) ENGINE=INNODB;
   
CREATE TABLE IF NOT EXISTS productos (
    id_pizza INT NOT NULL,
    id_hamburguesa INT NOT NULL,
    id_bebida INT NOT NULL,
    nom_pizza VARCHAR (255) NOT NULL,
    nom_hamburguesa VARCHAR (255) NOT NULL,
	nom_bebida VARCHAR (255) NOT NULL,
    descripcion_pizza VARCHAR (350) NOT NULL,
    descripcion_hamburguesa VARCHAR (350) NOT NULL,
    descripcion_bebida VARCHAR (350) NOT NULL,
    imagen_pizza MEDIUMBLOB,
    imagen_hamburguesa MEDIUMBLOB,
    imagen_bebida MEDIUMBLOB,
    precio_pizza FLOAT NOT NULL,
    precio_hamburguesa FLOAT NOT NULL,
    precio_bebida FLOAT NOT NULL,
    pedidos_id_pedido INT NOT NULL,
	PRIMARY KEY (id_pizza),
	CONSTRAINT fkproductos_pedidos
	FOREIGN KEY (pedidos_id_pedido)
	REFERENCES pedidos (id_pedido)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS categorias_pizzas (
    id_categoria_pizza INT NOT NULL,
    nom_categoria_pizza VARCHAR (255) NOT NULL,
	PRIMARY KEY (id_categoria_pizza),
     productos_id_pizza INT NOT NULL,
	CONSTRAINT fkcategorias_pizzas_productos_id_pizza
	FOREIGN KEY (productos_id_pizza)
	REFERENCES productos (id_pizza)
 )ENGINE=INNODB;    
 
CREATE TABLE IF NOT EXISTS tiendas (
    id_tienda INT NOT NULL,
    nom_tienda VARCHAR (255) NOT NULL,
    direccion VARCHAR (300) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad VARCHAR (45) NOT NULL,
	provincia VARCHAR (45),
	PRIMARY KEY (id_tienda),
    pedidos_id_pedido INT NOT NULL,
	CONSTRAINT fktiendas_pedidos
	FOREIGN KEY (pedidos_id_pedido)
	REFERENCES pedidos (id_pedido)
 )ENGINE=INNODB;     
 
CREATE TABLE IF NOT EXISTS empleados (
	id_empleado INT NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	primer_apellido VARCHAR (255) NOT NULL,
	segundo_apellido VARCHAR (255),
	nif VARCHAR(9) NOT NULL,
	tel INT NOT NULL,
	cocinero BIT NOT NULL,
	repartidor BIT NOT NULL,
	nom_repartidor_pedido VARCHAR (300) NOT NULL,
	fecha_hora DATETIME,
	PRIMARY KEY (id_empleado),
    tiendas_id_tienda INT NOT NULL,
	CONSTRAINT fkempleados_tiendas
	FOREIGN KEY (tiendas_id_tienda)
	REFERENCES tiendas (id_tienda)
)ENGINE=INNODB; 
