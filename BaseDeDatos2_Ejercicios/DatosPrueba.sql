-- Especificar Base de Datos
USE BaseDeDatos2_Database;

-- Empleados
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (4566543, 'Facundo', 5001);
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (7456742, 'Joaquin', 4999);

-- Ciudades
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Montevideo', 1500000, 'Mediana', 'Martinez', 'Pedro');
INSERT INTO Ciudades (nomCiud, habitantes, tipo, intendente, alcalde) VALUES ('Maldonado', 65000, 'Chica', 'Antia', 'Juan');

-- Maquinas
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('BB6547', 'Retroescavadora', 23, 'Rojo');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ACG646', 'Retroescavadora Barata', 9, 'Rojo');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('ZZGFDH', 'Taladro', 55, 'Azul');
INSERT INTO Maquinas (matricula, descripcion, costoHora, colorMaq) VALUES ('XXAS57', 'Cilindro', 11, 'Verde');

-- Obras
INSERT INTO Obras (codObr, descripcion, nomCiud, capataz) VALUES (235, 'Capilla', 'Montevideo', 'Perez');
INSERT INTO Obras (codObr, descripcion, nomCiud, capataz) VALUES (112, 'Estacion', 'Maldonado', 'Dominguez');

-- Trabajan
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES (11-11-2012);