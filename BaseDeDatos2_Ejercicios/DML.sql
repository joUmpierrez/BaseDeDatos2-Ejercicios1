-- Especificar Base de Datos
USE BaseDeDatos2_Database;

-- Para llamar a la view hacemos un SELECT: Ejemplo: SELECT * FROM [Emplados Sueldos Mayores 5000]

-- 1) Empleados con sueldo mayor a 5000
CREATE VIEW [Empleados Sueldos Mayores 5000] AS 
SELECT ci, nombre, sueldo FROM Empleados WHERE (sueldo > 5000);

-- 2) Empleados que trabajan en obras en montevideo
CREATE VIEW [Empleados Trabajan Montevideo] AS 
SELECT ci, nombre, sueldo FROM Trabajan 
INNER JOIN Empleados ON Trabajan.ciEMp = Empleados.ci
INNER JOIN Obras ON Trabajan.codObr = Obras.codObr 
WHERE nomCiud = 'Montevideo';

-- 3) Descripcion de las maquinas con costo de hora distinto de 0 y sus operarios
CREATE VIEW [Maquinas Costo0 Operarios] AS
SELECT descripcion, Empleados.ci, Empleados.nombre, Empleados.sueldo FROM Maquinas
INNER JOIN Trabajan ON Maquinas.matricula = Trabajan.matriculaMaq
INNER JOIN Empleados ON Trabajan.ciEmp = Empleados.ci
WHERE Maquinas.costoHora > 0;

-- 4) Sueldo total de los empleados
CREATE VIEW [Empleados SueldoTotal] AS
SELECT SUM(sueldo)  AS 'TotalSueldos' FROM Empleados;

-- 5) Promedio de horas trabajadas por los empleados por cada ciudad
-- !!!!!!! NO SE PUEDE !!!!!!!

-- 6) Descripcion de las maquinas de color rojo cuyo costo por hora es menor a 10 y no hayan sido usadas
CREATE VIEW [Maquinas Rojo NoUsadas] AS
SELECT * FROM Maquinas WHERE (colorMaq = 'Rojo' AND costoHora < 10) AND
NOT EXISTS (SELECT * FROM Trabajan WHERE Trabajan.matriculaMaq = Maquinas.matricula);

-- 7) Costo hora mayor de todas las maquinas
CREATE VIEW [Maquinas CostoMayor] AS
SELECT MAX(costoHora) AS Costo FROM Maquinas;


-- EJECUTAR
-- 1)
SELECT * FROM [Empleados Sueldos Mayores 5000];
-- 2)
SELECT * FROM [Empleados Trabajan Montevideo];
-- 3)
SELECT * FROM [Maquinas Costo0 Operarios];
-- 4)
SELECT * FROM [Empleados SueldoTotal];
-- 6)
SELECT * FROM [Maquinas Rojo NoUsadas];
-- 7)
SELECT * FROM [Maquinas CostoMayor];