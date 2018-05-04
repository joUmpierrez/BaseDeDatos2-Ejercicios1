-- Crea y usa la Base de Datos
CREATE DATABASE BaseDeDatos2_Database;
USE BaseDeDatos2_Database;


-- Crea las Tablas
CREATE TABLE Empleados (ci int CONSTRAINT PK_Empleados PRIMARY KEY, 
nombre varchar(50), sueldo int);

CREATE TABLE Ciudades (nomCiud varchar(50) CONSTRAINT PK_Ciudades PRIMARY KEY, 
habitantes int, tipo varchar(50), intendente varchar(50), alcalde varchar(50));

CREATE TABLE Maquinas (matricula varchar(50) CONSTRAINT PK_Maquinas PRIMARY KEY, 
descripcion varchar(100), costoHora int, colorMaq varchar(20));

CREATE TABLE Obras (codObr int CONSTRAINT PK_Obras PRIMARY KEY, 
descripcion varchar(100), capataz varchar(50), 
nomCiud varchar(50) CONSTRAINT FK_Obras_Ciudades FOREIGN KEY REFERENCES Ciudades(nomCiud));

CREATE TABLE Trabajan (fecha date, 
ciEmp int CONSTRAINT FK_Trabajan_Empleados FOREIGN KEY REFERENCES Empleados(ci), 
codObr int CONSTRAINT FK_Trabajan_Obras FOREIGN KEY REFERENCES Obras(codObr), 
matriculaMaq varchar(50) CONSTRAINT FK_Trabajan_Maquinas FOREIGN KEY REFERENCES Maquinas(matricula), 
CONSTRAINT PK_Trabajan PRIMARY KEY (fecha, ciEmp, codObr, matriculaMaq));


-- 1) El Sueldo de los empleados debe estar entre 0 y 10000 
ALTER TABLE Empleados ADD CHECK (sueldo >= 0 AND sueldo <= 10000);

-- 2) El capataz de la obra no puede repetirse en la tabla obras
ALTER TABLE Obras ADD UNIQUE (capataz);

-- 3) Los habitantes de las ciudades deben ser mayores a 0
ALTER TABLE Ciudades ADD CHECK (habitantes > 0);

-- 4) Los tipos de ciudad pueden ser 'Grande', 'Mediana' y 'Chica'
-- 4.1) Cambiar el data types de la columna [tipo] de 'varchar(50)' a 'enum['Chica', 'Mediana', 'Grande']' (Si se ingresa un valor que no este en el enum, el campo queda vacio);
-- ---------------------------------------- NO EXISTE ENUM EN SQL!!! ----------------------------------------

-- 4.2) Hacer un check en la columna [tipo] que verifique que los valores que se ingresen sean 'Chica', 'Mediana'o 'Grande'
ALTER TABLE Ciudades ADD CHECK (tipo = 'Chica' OR tipo = 'Mediana' OR tipo = 'Grande');

-- 5) No pueden existir descripciones de maquinas nulas
ALTER TABLE Maquinas ALTER COLUMN descripcion varchar(100);

-- 6) Modificar la tabla ciudades para que los campos [Intendente] y [Alcalde] sean unicos 
ALTER TABLE Ciudades ADD CONSTRAINT Unique_Int_Alc UNIQUE (intendente, alcalde);


-- EXTRA
-- Seleccionar CASCADA para Eliminacion de Trabajan cuando sea eliminado el Empleado
ALTER TABLE Trabajan DROP CONSTRAINT FK_Trabajan_Empleados;
ALTER TABLE Trabajan ADD CONSTRAINT FK_Trabajan_Empleados FOREIGN KEY (ciEmp) REFERENCES Empleados(ci) ON DELETE CASCADE;

-- Agrega a la tabla Ciudades la columna 'CantidadObras'
ALTER TABLE Ciudades ADD CantidadObras int; 
UPDATE CIUDADES SET CantidadObras = 0;