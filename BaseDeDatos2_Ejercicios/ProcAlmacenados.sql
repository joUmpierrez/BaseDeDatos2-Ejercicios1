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

-- 5) Dado el nombre una Ciudad, mostrar todas las Obras en Ella

-- 6) Dado el codigo de una obra mostrar el promedio de sueldo de sus empleados