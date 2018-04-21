USE BaseDeDatos2_Database
GO

-- Procedimientos Almacenados
-- 1) Agregar Empleado
EXEC AgregarEmpleado 46547854, 'Raul', 978;
EXEC AgregarEmpleado 11111111, 'Ruperto', 1;
GO

-- 2) Asignar a Un Empleado Existente una Obra y una Maquina
EXEC AsignarEmpleado '11-11-2011', 46547854, 235, 'BB6547';
GO

-- 3) Eliminar Empleado y sus Trabajo
EXEC BorrarEmpleado 46547854;
GO

-- 4) Modificar Sueldo Empleado
EXEC ModificarEmpleado 11111111, 1111;
GO

-- 5) Dado el nombre de una Ciudad, mostrar todas las Obras en ella
EXEC ObrasEnCiudad 'Montevideo';
GO

-- 6) Dado el nombre de Ciudad, indicar la cantidad de obras que hay en ella
EXEC CantidadObrasEnCiudad 'Montevideo';
GO

-- 7) Dado el codigo de una obra mostrar el promedio de sueldo de sus empleados
EXEC PromedioSueldosObra 235;
GO

-- EXTRAS
-- Muestra el empleado
EXEC MostrarEmpleado 11111111;

-- Devuelve un SI o un NO, en caso de que exista o no, una maquina
DECLARE @salidaMaquinaNoExiste varchar(2);
EXEC MaquinaExiste4 @salidaMaquinaNoExiste output, 'B456356';
PRINT @salidaMaquina;

DECLARE @salidaMaquinaExiste varchar(2);
EXEC MaquinaExiste4 @salidaMaquinaExiste output, 'ACG646';
SELECT @salidaMaquinaExiste;

-- Funciones Almacenadas
SELECT dbo.DevuelveUnDos(2);
SELECT * FROM dbo.F('Montevideo');