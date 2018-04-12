CREATE PROCEDURE tareasProfesor
	@email nvarchar(100),
	@codigoAsig nvarchar(10)
AS
	SELECT TareasGenericas.codigo, TareasGenericas.descripcion, TareasGenericas.hestimadas, TareasGenericas.explotacion, TareasGenericas.tipotarea 
	FROM TareasGenericas
	INNER JOIN GruposClase ON TareasGenericas.codasig = GruposClase.codigoAsig
	INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigoGrupo
	WHERE GruposClase.codigoasig = @codigoAsig AND ProfesoresGrupo.email = @email
