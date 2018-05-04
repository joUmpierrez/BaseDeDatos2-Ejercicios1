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
EXEC MaquinaExiste @salidaMaquinaNoExiste output, 'B456356';
PRINT @salidaMaquinaNoExiste;

DECLARE @salidaMaquinaExiste varchar(2);
EXEC MaquinaExiste @salidaMaquinaExiste output, 'ACG646';
SELECT @salidaMaquinaExiste;


-- Funciones Almacenadas
-- Una simple funcion que devuelve un 2
SELECT dbo.DevuelveUnDos(2);

-- Devuelve los valores que se encuentran en la ciudad de Montevideo
SELECT * FROM dbo.F('Montevideo');


-- Triggers
-- Sirve para probar que se haya agregado una obras a 'Montevideo'
INSERT INTO Obras (codObr, descripcion, capataz, nomCiud) VALUES (1131, 'Obra fea', 'RaulSendic', 'Montevideo'); 

-- Sirve para probar que se haya trasladado la obra de 'Montevideo' a 'Maldonado'
UPDATE Obras SET nomCiud = 'Maldonado' WHERE codObr = 1131;

-- Sirve para probar que se haya borrado una obras a 'Montevideo'
DELETE FROM Obras WHERE codObr = 1131;
