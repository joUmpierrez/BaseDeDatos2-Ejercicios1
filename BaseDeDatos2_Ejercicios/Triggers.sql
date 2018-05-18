-- CREAR UNA BASE DE DATOS PARA USAR CON LOS TRIGGERS
CREATE DATABASE BaseDeDatos2_Database_Triggers;
USE BaseDeDatos2_Database_Triggers;

CREATE TABLE [Control] (estado_actual int CONSTRAINT PK_Control PRIMARY KEY);
CREATE TABLE [Cuenta] (nro_cuenta varchar(10), balance int);
CREATE TABLE [Transaccion] (nro_cuenta varchar(10), hora_modificacion date, id_cliente varchar(10), ant_balance int, act_balance int,
CONSTRAINT PK_Transaccion PRIMARY KEY (nro_cuenta, hora_modificacion))
















USE BaseDeDatos2_Database;
GO;

-- EXTRAS
CREATE TRIGGER Agregar ON Empleados AFTER INSERT AS
RAISERROR ('Se ha creado!', 1, 2);
ALTER TABLE Ciudades ADD CantidadObras int;
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (888, 'Pedro Antonio', 23);

CREATE TRIGGER AgregarObra ON Obras AFTER INSERT AS
UPDATE Ciudades SET CantidadObras = CantidadObras+1 WHERE
nomCiud = (SELECT nomCiud FROM INSERTED);

CREATE TRIGGER BorrarObra ON Obras AFTER DELETE AS
UPDATE Ciudades SET CantidadObras = CantidadObras-1 WHERE
nomCiud = (SELECT nomCiud FROM DELETED);

CREATE TRIGGER ModificarObra ON Obras AFTER UPDATE AS
UPDATE Ciudades SET CantidadObras = CantidadObras-1 WHERE 
nomCiud = (SELECT nomCiud FROM DELETED)
UPDATE Ciudades SET CantidadObras = CantidadObras+1 WHERE 
nomCiud = (SELECT nomCiud FROM INSERTED);