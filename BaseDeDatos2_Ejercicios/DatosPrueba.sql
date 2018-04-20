-- Especificar Base de Datos
USE BaseDeDatos2_Database;

-- Empleados
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (4566543, 'Facundo', 5001);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (7456742, 'Joaquin', 4999);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (2353256, 'Raul', 5000);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (1214125, 'Antonio', 1350);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (7564746, 'Juan', 8914);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (3453466, 'Pepe', 9999);

-- Ciudades
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Montevideo', 1500000, 'Mediana', 'Martinez', 'Pedro');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Maldonado', 65000, 'Chica', 'Antia', 'Juan');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('San Juan', 13556, 'Mediana', 'Suarez', 'Antonio');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Rosario', 3256234, 'Chica', 'Messia', 'Senegal');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Rocha', 234523, 'Grande', 'Cavani', 'Perez');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Colonia', 12563, 'Grande', 'Saul', 'Pereira');

-- Maquinas
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('BB6547', 'Retroescavadora', 23, 'Rojo');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ACG646', 'Retroescavadora Barata', 9, 'Rojo');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ZZGFDH', 'Taladro', 55, 'Azul');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('XXAS57', 'Cilindro', 5, 'Verde');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('Y45GHJ', 'Canaleta', 0, 'Verde');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ASFGHJ', 'Cilindro Pesado', 9, 'Rojo');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ASCCB5', 'Taladro Pesado', 11, 'Rojo');

-- Obras
INSERT INTO Obras (codObr, descripcion, nomCiud, capataz) VALUES (235, 'Capilla', 'Montevideo', 'Perez');
INSERT INTO Obras (codObr, descripcion, nomCiud, capataz) VALUES (112, 'Estacion', 'Maldonado', 'Dominguez');

-- Trabajan
-- Obras en Montevideo
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 4566543, 235, 'BB6547'); -- Con Maquina Roja costo mayor a 10
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 7456742, 235, 'ACG646'); -- Con Maquina Roja costo menor a 10
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 2353256, 235, 'Y45GHJ'); -- Con Maquina de costo hora 0

-- Obras Fuera de Monteviode
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 1214125, 112, 'ZZGFDH'); -- Con Maquina  != Roja costo mayor a 10
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 7564746, 112, 'XXAS57'); -- Con Maquina  != Roja costo menor a 10
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES ('11-11-2012', 3453466, 112, 'Y45GHJ'); -- Con Maquina de costo hora 0

