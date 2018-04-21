USE BaseDeDatos2_Database;
GO

-- Una funcion Almacenada que devuelva un dos
CREATE FUNCTION DevuelveUnDos (@a int) RETURNS int AS
BEGIN
DECLARE @b int;
SET @b = 1+1;
RETURN(SELECT @b)
END

-- Una funcion que devuleva una tabla con cantidades dentro de trabajan
CREATE FUNCTION F(@ciudad varchar(50)) RETURNS @t table(tipo varchar(50), cantidad int) AS
BEGIN
DECLARE @cantObras int;
DECLARE @cantMaqs int;
DECLARE @cantEmps int;
SET @cantObras = (SELECT COUNT(codObr) FROM Obras WHERE nomCiud = @ciudad);
SET @cantMaqs = (SELECT COUNT(matriculaMaq) FROM Trabajan WHERE codObr = (SELECT codObr FROM Obras WHERE nomCiud = @ciudad));
SET @cantEmps = (SELECT COUNT(ciEmp) FROM Trabajan WHERE codObr = (SELECT codObr FROM Obras WHERE nomCiud = @ciudad));

INSERT INTO @t(tipo, cantidad) VALUES ('Obras', @cantObras);
INSERT INTO @t(tipo, cantidad) VALUES ('Maquinas', @cantMaqs);
INSERT INTO @t(tipo, cantidad) VALUES ('Empleados', @cantEmps);
RETURN
END
