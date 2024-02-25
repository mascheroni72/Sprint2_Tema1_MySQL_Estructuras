CREATE DATABASE IF NOT EXISTS Base_OpticaCuloBotella;
USE Base_OpticaCuloBotella;

CREATE TABLE IF NOT EXISTS proveedores (
id_proveedor INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
primer_apellido VARCHAR(255) NOT NULL,
segundo_apellido VARCHAR(255),
direccion VARCHAR(255) NOT NULL,
tel INT(12) NOT NULL,
fax INT(12),
nif VARCHAR(9) NOT NULL ,
PRIMARY KEY(id_proveedor) 
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS gafas (
id_marca INT NOT NULL,
nombre VARCHAR(45) NOT NULL ,
graduacion_lente_iz FLOAT(4) NOT NULL ,
graduacion_lente_de FLOAT(4) NOT NULL ,
tipo_montura CHAR(10) NOT NULL ,
color_montura VARCHAR(45),
color_lente_iz VARCHAR(45),
color_lente_de VARCHAR(45),
precio FLOAT(8) NOT NULL ,
PRIMARY KEY(id_marca),
proveedores_id_proveedor INT NOT NULL,
CONSTRAINT fkgafas_proveedores
FOREIGN KEY (proveedores_id_proveedor)
REFERENCES proveedores (id_proveedor)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
primer_apellido VARCHAR(255) NOT NULL,
segundo_apellido VARCHAR(255),
direccion VARCHAR(300) NOT NULL,
tel INT(12) NOT NULL,
email VARCHAR(30) NOT NULL,
fecha_alta DATE,
recomendado_por_cliente VARCHAR (350),
PRIMARY KEY (id_cliente),
gafas_id_marca INT NOT NULL,
CONSTRAINT fkgafas_clientes
FOREIGN KEY (gafas_id_marca)
REFERENCES gafas (id_marca)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS empleados (
id_empleado INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
primer_apellido VARCHAR (255) NOT NULL,
segundo_apellido VARCHAR (255),
PRIMARY KEY (id_empleado)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS ventas (
id_venta INT NOT NULL,
fecha_venta DATE,
PRIMARY KEY (id_venta),
gafas_id_marca INT NOT NULL,
clientes_id_cliente INT NOT NULL,
empleados_id_empleado INT NOT NULL,
CONSTRAINT fkgafas_ventas
FOREIGN KEY (gafas_id_marca)
REFERENCES gafas (id_marca),
CONSTRAINT fkclientes_ventas
FOREIGN KEY (clientes_id_cliente)
REFERENCES clientes (id_cliente),
CONSTRAINT fkempleados_ventas
FOREIGN KEY (empleados_id_empleado)
REFERENCES empleados (id_empleado)
) ENGINE=INNODB;