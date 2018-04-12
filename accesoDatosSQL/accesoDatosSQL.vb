Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class accesoDatosSQL
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand
    Public Shared Function conectar() As String
        Try
            'conexion.ConnectionString = “Server=tcp:practicahads.database.windows.net,1433;Initial Catalog=HADS00-TAREAS;Persist Security Info=False;User ID=Asier;Password=JAVadillo-2018;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.ConnectionString = "Server=tcp:hads13-2018.database.windows.net,1433;Initial Catalog=hads13;Persist Security Info=False;User ID=aaguayo001;Password=Patata123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            'conexion.ConnectionString = “Server=tcp: hads13.database.windows.net,1433;Initial Catalog=hads13;Persist Security Info=False;User ID=aassiieerr@hotmail.com@hads13;Password=Patata123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Function desconectar() As String
        Try
            conexion.Close()
        Catch ex As Exception
            Return "ERROR AL DESCONECTAR: " + ex.Message
        End Try
        Return "DESCONEXION OK"
    End Function
    Public Shared Function insertar(ByVal email As String,
                                    ByVal nombre As String,
                                    ByVal apellido1 As String,
                                    ByVal apellido2 As String,
                                    ByVal numconfir As Integer,
                                    ByVal tipo As String,
                                    ByVal pass As String) As String

        Dim apellidos As String = apellido1 + " " + apellido2
        Dim confirmado As Boolean = False

        If verificarEmail(email) Then
            Return "El email que desea introducir ya existe."
        End If

        comando = New SqlCommand("insertarUsuario", conexion)
        comando.CommandType = CommandType.StoredProcedure
        comando.Parameters.AddWithValue("email", New SqlParameter).Value = email
        comando.Parameters.AddWithValue("nombre", New SqlParameter).Value = nombre
        comando.Parameters.AddWithValue("apellidos", New SqlParameter).Value = apellidos
        comando.Parameters.AddWithValue("numconfir", New SqlParameter).Value = numconfir
        comando.Parameters.AddWithValue("confirmado", New SqlParameter).Value = confirmado
        comando.Parameters.AddWithValue("tipo", New SqlParameter).Value = tipo
        comando.Parameters.AddWithValue("pass", New SqlParameter).Value = encriptar(pass)

        Dim numregs As Integer
        Try
            accesoDatosSQL.conectar()
            numregs = comando.ExecuteNonQuery()
            accesoDatosSQL.desconectar()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return ("El registro se ha efectuado correctamente.")
    End Function
    Public Shared Function generarNumero() As Integer
        Randomize()
        Dim NumConf As Integer = CLng(Rnd() * 9000000) + 1000000
        Return NumConf
    End Function
    Public Shared Function verificarNumero(ByVal email As String, ByVal numconf As Integer) As Boolean
        Dim numconfBD As Integer
        'comando = New SqlCommand("verificarNumero", conexion)
        'comando.CommandType = CommandType.StoredProcedure
        'comando.Parameters.AddWithValue("email", New SqlParameter).Value = email

        'comando = New SqlCommand("selectUsuarios", conexion)
        'comando.CommandType = CommandType.StoredProcedure
        Dim DR As SqlDataReader
        Try

            accesoDatosSQL.conectar()
            Dim st = "SELECT numconfir FROM [Usuarios] WHERE email = '" + email + "';"
            comando = New SqlCommand(st, conexion)
            DR = comando.ExecuteReader
            DR.Read()

            If DR.HasRows Then
                numconfBD = DR(0)
            End If

            accesoDatosSQL.desconectar()
            If numconfBD = numconf Then
                Return True
            End If
            Return False
        Catch ex As Exception
            Return ex.Message
        End Try

    End Function

    Public Shared Function confirmarUsuario(ByVal email As String) As Boolean

        accesoDatosSQL.conectar()

        Dim st = "update Usuarios set Confirmado =  1 where email = '" + email + "'"
        comando = New SqlCommand(st, conexion)

        Dim numregs As Integer
        Try
            accesoDatosSQL.conectar()
            numregs = comando.ExecuteNonQuery()
            accesoDatosSQL.desconectar()

        Catch ex As Exception
            Return 0
        End Try
        Return 1
    End Function

    Public Shared Function cambiarPass(ByVal email As String, ByVal pass As String) As Boolean

        accesoDatosSQL.conectar()

        Dim st = "update Usuarios set Pass =  '" + pass + "' where email = '" + email + "'"
        comando = New SqlCommand(st, conexion)

        Dim numregs As Integer
        Try
            accesoDatosSQL.conectar()
            numregs = comando.ExecuteNonQuery()
            accesoDatosSQL.desconectar()

        Catch ex As Exception
            Return 0
        End Try
        Return 1
    End Function

    Public Shared Function verificarEmail(ByVal email As String)

        accesoDatosSQL.conectar()

        'if rows = 0, no existe el email, devuelvo 1. else devuelvo 0

        Dim dr As SqlDataReader
        Dim st = "select * from Usuarios where email = '" + email + "'"
        comando = New SqlCommand(st, conexion)

        Try
            accesoDatosSQL.conectar()
            dr = comando.ExecuteReader()
            dr.Read()

            If dr.HasRows Then
                accesoDatosSQL.desconectar()
                Return 1
            End If

            accesoDatosSQL.desconectar()

        Catch ex As Exception
            accesoDatosSQL.desconectar()
            Return ex.Message
        End Try
        Return 0
    End Function
    Public Shared Function iniciarSesion(ByVal email As String, ByVal pass As String)

        Dim dr As SqlDataReader
        Dim st = "select * from Usuarios where email = '" + email + "' and pass = '" + encriptar(pass) + "'"
        comando = New SqlCommand(st, conexion)

        Try
            accesoDatosSQL.conectar()
            dr = comando.ExecuteReader()
            dr.Read()
            If dr.HasRows Then
                accesoDatosSQL.desconectar()
                Return 1
            End If
            accesoDatosSQL.desconectar()
        Catch ex As Exception
            accesoDatosSQL.desconectar()
            Return ex.Message
        End Try
        Return 0
    End Function

    Public Shared Function tipo(ByVal email As String) As String
        Dim dr As SqlDataReader
        Dim st = "select tipo from Usuarios where email = '" + email + "'"
        Dim tipoUsuario As String = ""
        comando = New SqlCommand(st, conexion)
        Try
            accesoDatosSQL.conectar()
            dr = comando.ExecuteReader()
            dr.Read()
            If dr.HasRows Then
                tipoUsuario = dr(0)
            End If
            accesoDatosSQL.desconectar()
            Return tipoUsuario
        Catch ex As Exception
            accesoDatosSQL.desconectar()
            Return ex.Message
        End Try
        Return ""
    End Function

    Public Shared Function asignaturasAlumno(ByVal email As String) As SqlDataAdapter
        Dim datadapter As SqlDataAdapter = New SqlDataAdapter()
        Try
            accesoDatosSQL.conectar()
            Dim st = "Select GruposClase.codigoasig FROM 
                            (GruposClase INNER JOIN EstudiantesGrupo ON GruposClase.codigo=EstudiantesGrupo.grupo) 
                            INNER JOIN Usuarios ON EstudiantesGrupo.Email=Usuarios.email WHERE Usuarios.email= '" + email + "'"
            datadapter = New SqlDataAdapter(st, conexion)
            accesoDatosSQL.desconectar()
        Catch ex As Exception

        End Try

        Return datadapter
    End Function

    Public Function insertarTarea(ByVal email As String, ByVal codigoTarea As String, ByVal horasEst As String, ByVal horasReales As String) As String
        Dim st = "insert into EstudiantesTareas (EMAIL, CODTAREA, HESTIMADAS, HREALES) values ('" + email + "', '" + codigoTarea + "', '" + horasEst + "', '" + horasReales + "')"
        comando = New SqlCommand(st, conexion)
        Try
            accesoDatosSQL.conectar()
            comando.ExecuteNonQuery()
            accesoDatosSQL.desconectar()
            Return "Se ha añadido correctamente."
        Catch ex As Exception
            accesoDatosSQL.desconectar()
            Return ex.Message
        End Try
    End Function

    Public Function tareasGenericas() As SqlDataAdapter
        Dim datadapter As SqlDataAdapter = New SqlDataAdapter()
        Try
            accesoDatosSQL.conectar()
            Dim st = "SELECT * from TareasGenericas"
            datadapter = New SqlDataAdapter(st, conexion)
            accesoDatosSQL.desconectar()
        Catch ex As Exception

        End Try

        Return datadapter
    End Function

    Public Function insertarTarea(ByVal codigo As String, ByVal descripcion As String, ByVal asignatura As String, ByVal hestimadas As String, ByVal explotacion As Boolean, ByVal tipoTarea As String) As String

        Try
            accesoDatosSQL.conectar()
            Dim dataAdapterAsignaturas As New SqlClient.SqlDataAdapter
            dataAdapterAsignaturas = tareasGenericas()
            Dim bldMbrs As New SqlCommandBuilder(dataAdapterAsignaturas)
            Dim dataSetAsignaturas As New DataSet()
            dataAdapterAsignaturas.Fill(dataSetAsignaturas, "TareasGenericas")

            Dim dataTableAsignaturas = New DataTable()
            dataTableAsignaturas = dataSetAsignaturas.Tables("TareasGenericas")

            Dim nuevaTarea As DataRow
            nuevaTarea = dataTableAsignaturas.NewRow()
            nuevaTarea("Codigo") = codigo
            nuevaTarea("Descripcion") = descripcion
            nuevaTarea("CodAsig") = asignatura
            nuevaTarea("Hestimadas") = hestimadas
            nuevaTarea("Explotacion") = explotacion
            nuevaTarea("TipoTarea") = tipoTarea

            dataSetAsignaturas.Tables("TareasGenericas").Rows.InsertAt(nuevaTarea, dataTableAsignaturas.Rows.Count + 1)

            dataAdapterAsignaturas.Update(dataSetAsignaturas, "TareasGenericas")
            dataSetAsignaturas.AcceptChanges()

            accesoDatosSQL.desconectar()

            Return "La nueva tarea se ha añadido con éxito."
        Catch ex As Exception
            accesoDatosSQL.desconectar()
            Return ex.Message
        End Try
    End Function

    Public Function tareasAsignatura(ByVal asignatura As String, ByVal email As String) As DataSet
        Dim datadapter As SqlDataAdapter = New SqlDataAdapter()
        Dim dataSetTareas As New DataSet("TareasGenericas")
        Dim dataTableTareas As New DataTable
        Try
            accesoDatosSQL.conectar()

            Dim comando As SqlCommand = New SqlCommand("TareasProfesor", conexion)
            comando.Parameters.AddWithValue("@codigoAsig", asignatura)
            comando.Parameters.AddWithValue("@email", email)
            comando.CommandType = CommandType.StoredProcedure
            datadapter.SelectCommand = comando
            datadapter.Fill(dataSetTareas, "TareasGenericas")
            accesoDatosSQL.desconectar()
        Catch ex As Exception

        End Try

        Return dataSetTareas
    End Function

    Public Shared Function encriptar(ByVal pass As String) As String

        Dim sha1 As SHA1 = New SHA1CryptoServiceProvider

        Dim imputBytes As Byte() = System.Text.Encoding.ASCII.GetBytes(pass)
        Dim hash = sha1.ComputeHash(imputBytes)

        Return Convert.ToBase64String(hash)

    End Function

End Class
