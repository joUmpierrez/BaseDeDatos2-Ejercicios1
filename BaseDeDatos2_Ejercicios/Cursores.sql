USE BaseDeDatos2_Database;
GO;

CREATE FUNCTION NombresDeCiudades ()
RETURNS varchar(200)
AS BEGIN
DECLARE @nombre varchar(50);
DECLARE @resultado varchar(200);
SET @resultado = ' ';
DECLARE NombresCiudades CURSOR FOR SELECT nomciud FROM Ciudades
OPEN NombresCiudades
FETCH NEXT FROM NombresCiudades into @nombre
WHILE @@fetch_status = 0
BEGIN
SET @resultado += @nombre
FETCH NEXT FROM NombresCiudades into @nombre
END
CLOSE NombresCiudades
RETURN @resultado
END

SELECT dbo.NombresDeCiudades() AS 'Nombre Ciudades';