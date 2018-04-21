USE BaseDeDatos2_Database;
GO

-- 1) Agregar Empleado
CREATE PROCEDURE AgregarEmpleado
	@ci int, @nombre varchar(50),@sueldo int
AS
BEGIN
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (@ci, @nombre, @sueldo);
END
GO

-- 2) Asignar a Un Empleado Existente una Obra y una Maquina
CREATE PROCEDURE AsignarEmpleado
	@fecha date, @ciEmp int, @codObr int, @matriculaMaq varchar(50)
AS
BEGIN
INSERT INTO Trabajan (fecha, ciEmp, codObr, matriculaMaq) VALUES (@fecha, @ciEmp, @codObr, @matriculaMaq);
END
GO

-- 3) Eliminar Empleado y sus Trabajo
CREATE PROCEDURE BorrarEmpleado 
	@ci int
AS
BEGIN
DELETE FROM Empleados WHERE (ci = @ci);
END
GO

-- 4) Modificar Sueldo Empleado
CREATE PROCEDURE ModificarEmpleado 
	@ci int, @nuevoSueldo int
AS
BEGIN
UPDATE Empleados SET sueldo = @nuevoSueldo WHERE ci = @ci;
END
GO

-- 5) Dado el nombre de una Ciudad, mostrar todas las Obras en ella
CREATE PROCEDURE ObrasEnCiudad
@nomCiud varchar(50)
AS
BEGIN
SELECT codObr, descripcion, nomCiud, capataz FROM Obras
WHERE Obras.nomCiud = @nomCiud;
END
GO

-- 6) Dado el nombre de Ciudad, indicar la cantidad de obras que hay en ella
CREATE PROCEDURE CantidadObrasEnCiudad
@nomCiud varchar(50)
AS
BEGIN
SELECT COUNT (nomCiud) AS 'Cantidad' FROM Obras
WHERE nomCiud = @nomCiud;
END
GO

-- 7) Dado el codigo de una obra mostrar el promedio de sueldo de sus empleados
CREATE PROCEDURE PromedioSueldosObra
@codObr int
AS
BEGIN
SELECT AVG (sueldo) AS 'Promedio' FROM Empleados
INNER JOIN Trabajan ON Empleados.ci = Trabajan.ciEmp
WHERE codObr = @codObr;
END
GO

-- EXTRAS
-- Mostrar Info Empleado
CREATE PROCEDURE MostrarEmpleado
@ci int
AS
BEGIN
SELECT * FROM Empleados WHERE ci = @ci;
END
GO

-- Mostrar SI o NO si una Maquina Existe
CREATE PROCEDURE MaquinaExiste @salida varchar(2) output,
@matricula varchar(50)
AS
BEGIN
IF EXISTS (SELECT * FROM Maquinas WHERE matricula = @matricula) BEGIN 
SET @salida = 'SI'
END
ELSE BEGIN
SET @salida = 'NO'
END
END
GO