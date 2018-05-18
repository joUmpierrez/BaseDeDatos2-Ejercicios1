-- 1 ---> Data Definition Lenguaje (DDL) 
-- CREATE
-- DROP
-- ALTER
-- CONSTRAINTS

-- 2 ---> Data Manipulation Lenguaje (DML)
-- Definicion
CREATE VIEW Empleados_jovenes AS
Select * FROM Empleados WHERE
ci > 350000;
-- Ejecucion
SELECT [Empleados_jovenes];

-- 3 ---> Stored Procedures (SP)
-- Sin Parametros
-- Definicion
CREATE PROCEDURE nombre_proc AS
SELECT * FROM Empleados;
-- Ejecucion
EXEC nombre_proc;

-- Con Parametros
-- Definicion
CREATE PROCEDURE nombre_procB @ci, @existe char(2) OUTPUT AS
SET @existe = 'NO'
IF EXISTS (SELECT * FROM Empleados WHERE ci = @ci )
BEGIN
	SET @existe = 'SI'
END
-- Ejecucion
DECLARE @resultado char(2);
EXEC nombre_procB, @resultado OUTPUT;
SELECT @resultado;

-- 4 ---> Stored Functions (SF)
-- Definicion
CREATE FUNCTION FuncionSuma (@a int, @b int) RETURNS int AS
BEGIN
DECLARE @c int;
SET @c = @a + @b;
RETURNS (SELECT @c)
END
-- Ejecucion
SELECT FuncionSuma (2, 3);

-- 5 ---> Triggers


-- 6 ---> Asertos


-- 7 ---> Cursor


-- 8 --->


-- 9 --->

