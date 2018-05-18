CREATE DATABASE BaseDeDatos2_PreparacionParcial
GO;

USE BaseDeDatos2_PreparacionParcial;
CREATE TABLE Montura (IdMontura int CONSTRAINT PK_Montura PRIMARY KEY, Marca varchar(20), Precio int, Nombre varchar(20));
                                                                                                                     
CREATE TABLE Color (IdColor int CONSTRAINT PK_Color PRIMARY KEY, DescripcionColor varchar(20));
                                                                                          
CREATE TABLE Stock (IdMontura int, IdColor int, Cantidad int,
CONSTRAINT PK_Stock PRIMARY KEY (IdMontura, IdColor),
CONSTRAINT FK_Stock_Montura FOREIGN KEY (IdMontura) REFERENCES Montura(IdMontura),
CONSTRAINT FK_Stock_Color FOREIGN KEY (IdColor) REFERENCES Color(IdColor));
                                                                 
CREATE TABLE Venta (Fecha date, IdMontura int, IdColor int, CantVendido int, Precio int,
CONSTRAINT PK_Venta PRIMARY KEY (Fecha, IdMontura, IdColor),
CONSTRAINT FK_Venta_Montura FOREIGN KEY (IdMontura) REFERENCES Montura(IdMontura),
CONSTRAINT FK_Venta_Color FOREIGN KEY (IdColor) REFERENCES Color(IdColor));	

-- 1) Precio montura entre 1.000 y 100.000
ALTER TABLE Montura ADD CHECK (Precio >= 1000 AND Precio <= 100000)

-- 2) Crear Indices sobre FKs ||//No se que hacer aca\\||

-- 3) Realizar Modificaciones Utilizando PROC o FUNC
-- 3.a) Borrar las monturas que valgan menos de x pesos y donde el nombre contenga ‘error’.
CREATE PROCEDURE BorrarMonturas
@valorAborrar int
 AS
BEGIN
DELETE FROM Montura WHERE Precio < @valorAborrar AND Nombre = 'error';
END

-- 3.b) Modificar el precio total de las ventas realizadas un determinado día. Se necesita decrementar el mismo en un 10%.
CREATE PROCEDURE ModificarPrecioVentas
@dia date
AS
BEGIN
UPDATE Venta SET Precio = Precio*0.9 WHERE Fecha = @dia;
END

-- 3.c) Borrar una determinada montura y los datos asociados a ésta.
CREATE PROCEDURE BorrarMontura
@montura int
AS
BEGIN
DELETE FROM Stock WHERE IdMontura = @montura;
DELETE FROM Venta WHERE IdMontura = @montura;
DELETE FROM Montura WHERE IdMontura = @montura;
END

-- 4) Resolver las siguientes consultas SQL utilizando vistas, procedimientos o funciones

-- 4.a)	Se necesita tener un listado de las monturas con un determinado nombre que valgan más de 10.000 pesos, 
--		en donde dichas monturas se hayan vendido en un determinado día o en otro día.
CREATE VIEW [MonturasCarasVendidas] AS
SELECT * FROM Montura WHERE EXISTS
(SELECT * FROM Venta WHERE IdMontura = Montura.IdMontura);

-- 4.b)	Seleccionar las monturas donde haya stock para dos colores diferentes.
CREATE VIEW MonturasDosColores AS
SELECT * FROM Montura WHERE EXISTS -- --> Selecciona las Monturas donde se cumpla la siguiente condicion:
(SELECT COUNT (IdColor) FROM Stock -- --> Selecciona cuantos IdColor hay en la tabla Stocks
GROUP BY  (IdMontura)              -- --> Agrupados segun su IdMontura
HAVING COUNT (IdColor) = 2);       -- --> Pero de esos, solo selecciona aquellos en los cuales el COUNT (IdColor) sea igual a [2]

-- 4.c)	Seleccionar la combinación montura-color donde dicha combinación NO se haya vendido nunca en la óptica.
CREATE VIEW NoVendida AS
SELECT * FROM Stock WHERE NOT EXISTS
(SELECT * FROM Venta WHERE IdMontura = Stock.IdMontura AND IdColor = Stock.IdColor);

-- 4.d)	Interesa tener un detalle de los últimos 5 días. 
--		1.	Fecha de venta
--		2.	Cantidad vendido
--		3.	Precio de la venta 
--		4.	Nombre de la montura
--		5.	Marca de la montura
--		6.	Descripción del color de la montura. 
--		Ordenar la salida por fecha y montura.

CREATE VIEW [Ventas5Dias]
AS
SELECT Venta.Fecha, Venta.CantVendido, Venta.Precio, Montura.Nombre AS 'Nombre de la Montura', Color.DescripcionColor AS 'Descripcion Color' FROM Venta
INNER JOIN Montura ON Venta.IdMontura = Montura.IdMontura
INNER JOIN Color ON Venta.IdColor = Color.IdColor
WHERE Fecha >= GETDATE()-5;

SELECT * FROM [Ventas5Dias] ORDER BY Fecha, 'Nombre de la Montura' ASC;


-- Practica de INNER JOINS
CREATE PROCEDURE BuscarPorCiudad (@nombreCiudad varchar(50))
AS BEGIN
SELECT Empleados.ci AS 'Cedula', Empleados.nombre AS 'Nombre', Empleados.sueldo AS 'Sueldo', Maquinas.matricula AS 'Matricula', 
Maquinas.descripcion AS 'Descripcion', Maquinas.colorMaq AS 'Color', Maquinas.costoHora AS 'Costo Hora' 
FROM Trabajan 
INNER JOIN Obras ON Trabajan.codObr = Obras.codObr
INNER JOIN Empleados ON Trabajan.ciEmp = Empleados.ci
INNER JOIN Maquinas ON Trabajan.matriculaMaq = Maquinas.matricula
WHERE Obras.nomCiud = @nombreCiudad
END

EXEC BuscarPorCiudad 'Montevideo';

