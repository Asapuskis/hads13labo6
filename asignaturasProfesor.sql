CREATE PROCEDURE asignaturasProfesor
	@email nvarchar(100)
AS
	SELECT GruposClase.codigoAsig
	FROM (GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.CodigoGrupo)
				INNER JOIN Usuarios ON ProfesoresGrupo.Email = Usuarios.email 
	WHERE Usuarios.email = @email
RETURN 0