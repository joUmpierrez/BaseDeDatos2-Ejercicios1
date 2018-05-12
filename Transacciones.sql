USE BaseDeDatos2_Database;
GO;

ALTER PROCEDURE InsertarCiudad 
AS BEGIN 
	BEGIN TRY BEGIN TRAN
		INSERT INTO Ciudades(nomCiud, habitantes, alcalde, intendente, tipo, CantidadObras) values ('Rochita', 432, 'PedroS', 'Error', 'Grande', 0);
		INSERT INTO Ciudades(nomCiud, habitantes, alcalde, intendente, tipo, CantidadObras) values ('Sanca', 120000, 'PedroM', 'ErrorR', 'Grande', 0);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT @@error
	END CATCH
END

EXEC InsertarCiudad;


