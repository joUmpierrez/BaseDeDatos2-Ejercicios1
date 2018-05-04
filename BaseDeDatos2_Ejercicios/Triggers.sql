USE BaseDeDatos2_Database;
GO;





-- EXTRAS
CREATE TRIGGER Agregar ON Empleados AFTER INSERT AS
RAISERROR ('Se ha creado!', 1, 2);
ALTER TABLE Ciudades ADD CantidadObras int;
INSERT INTO Empleados (ci, nombre, sueldo) VALUES (888, 'Pedro Antonio', 23);

CREATE TRIGGER AgregarObra ON Obras AFTER INSERT AS
UPDATE Ciudades SET CantidadObras = CantidadObras+1 WHERE
nomCiud = (SELECT nomCiud FROM INSERTED);

CREATE TRIGGER BorrarObra ON Obras AFTER DELETE AS
UPDATE Ciudades SET CantidadObras = CantidadObras-1 WHERE
nomCiud = (SELECT nomCiud FROM DELETED);

CREATE TRIGGER ModificarObra ON Obras AFTER UPDATE AS
UPDATE Ciudades SET CantidadObras = CantidadObras-1 WHERE 
nomCiud = (SELECT nomCiud FROM DELETED)
UPDATE Ciudades SET CantidadObras = CantidadObras+1 WHERE 
nomCiud = (SELECT nomCiud FROM INSERTED);