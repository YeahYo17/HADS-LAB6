Imports System.Net.Mail
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

Public Class LibraryVB

    'Variable de Conexion global
    Private Conexion As New System.Data.SqlClient.SqlConnection

    'Solo funciona con esta para AZURE.
    'Private dReader As SqlDataReader

    'Function Conectar:
    ' - Realiza la conexion con la base de datos.
    ' - Devuelve un string, con 'conexion establecida' si todo va bien, el error en otro caso
    Public Function Conectar() As String
        Try
            ' --- AZURE ---
            Conexion.ConnectionString = "Server=tcp:hads21.database.windows.net,1433;Database=HADS21;User ID=starkgs@hotmail.com@hads21;Password=HADS21perro;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;MultipleActiveResultSets=true"

            ' --- LOCALHOST ---
            'Conexion.ConnectionString = "Data Source=158.227.106.20;Initial Catalog=HADS21-USUARIOS;Integrated Security=False; User ID=HADS21;Password=perro;" &
            '    "Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"

            Conexion.Open()

        Catch ex As Exception
            Return "ERROR: " & ex.Message
        End Try
        Return "Conexion Establecida."

    End Function

    'Sub Desconectar()
    ' - Cierra la conexion con la base de datos.
    Public Sub Desconectar()
        Conexion.Close()
    End Sub

    'Sub BorrarUser:
    ' - Borra el usuario con Email igual a 'email' pasado como parametro de la base de datos.
    Public Sub BorrarUser(ByVal email As String, ByRef errorLbl As String)

        Dim comando As New System.Data.SqlClient.SqlCommand
        Dim strSql As String

        Dim filasAfectadas As Integer

        strSql = "DELETE FROM USERS WHERE Email='" & email & "'"
        comando = New SqlClient.SqlCommand(strSql, Conexion)

        Try
            filasAfectadas = comando.ExecuteNonQuery()
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

    End Sub


    ' Function EmailRepetido:
    ' - TRUE, si el email pasado como parametro esta repetido, es decir, si esta ya en la base de datos.
    ' - FALSE, si el email pasado como parametro no se encuentra en la base de datos.
    Public Function EmailRepetido(ByVal email As String, ByRef errorLbl As String) As Boolean

        Dim Comando1 As New SqlClient.SqlCommand

        Dim emailRep As String
        Dim strSql As String

        ' --- HADS21 ---
        'strSql = " SELECT Email FROM USERS WHERE Email='" & email & "'"
        ' --- Azure ---
        strSql = " SELECT email FROM Usuarios WHERE email='" & email & "'"
        Comando1 = New SqlClient.SqlCommand(strSql, Conexion)

        Try
            emailRep = CStr(Comando1.ExecuteScalar())
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

        If emailRep = email Then
            errorLbl = "Ese Email ya esta registrado en la base de datos."
            Return True
        Else
            Return False
        End If

    End Function

    ' Sub InsertarUser:
    ' - Inserta un usuario en la base de datos, con sus datos pasados como parametro.
    ' - Devuelve el NumConf del usuario.
    Public Function InsertarUser(ByVal email As String, ByVal name As String, ByVal ap1 As String, ByVal ap2 As String, ByVal dni As String, ByVal pass As String, ByVal pregunta As String, ByVal respuesta As String, ByRef errorLbl As String) As Integer

        Dim Comando As New SqlClient.SqlCommand

        Dim NumConf As Integer
        Dim strSql As String
        Dim filasAfectadas As Integer

        Randomize()
        NumConf = CInt(Rnd() * 9000000) + 1000000

        strSql = "INSERT INTO USERS(Email,Nombre,Apellido1,Apellido2,Dni,Password,Pregunta,Respuesta,NumConf) VALUES ('" & email & "','" & name & "','" & ap1 & "','" & ap2 & "','" & dni & "','" & pass & "','" & pregunta & "','" & respuesta & "','" & NumConf & "')"
        Comando = New SqlClient.SqlCommand(strSql, Conexion)

        Try
            filasAfectadas = Comando.ExecuteNonQuery()
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
            BorrarUser(email, errorLbl)
            Return -7
        End Try

        Return NumConf
    End Function

    ' Sub InsertarUserAzure:
    ' - Inserta un usuario en la base de datos, con sus datos pasados como parametro.
    ' - Devuelve el numero de filas afectadas de la BD, -7 en caso de error.
    Public Function InsertarUserAzure(ByVal email As String, ByVal name As String, ByVal preg As String, ByVal res As String, ByVal dni As String, ByVal grupo As String, ByVal tipo As String, ByVal pass As String, ByRef errorLbl As String) As Integer

        Dim Comando As New SqlClient.SqlCommand
        Dim strSql As String
        Dim filasAfectadas As Integer

        strSql = "INSERT INTO Usuarios(email,nombre,pregunta, respuesta, dni, confirmado, grupo, tipo, pass) VALUES ('" & email & "','" & name & "','" & preg & "','" & res & "','" & dni & "','" & 1 & "','" & grupo & "','" & tipo & "','" & pass & "')"
        Comando = New SqlClient.SqlCommand(strSql, Conexion)

        Try
            filasAfectadas = Comando.ExecuteNonQuery()
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
            BorrarUser(email, errorLbl)
            Return -7
        End Try

        Return filasAfectadas

    End Function


    'Function CrearCorreo:
    ' - Crea un objeto mensaje, añade destinatario, asunto, mensaje...etc ('correo' parametro, email de destinatario)
    ' - Devuelve el objeto MailMessage (mail)
    Public Function CrearCorreo(ByVal correo As String) As MailMessage

        Dim mail As New MailMessage()

        mail.IsBodyHtml = True ' Para enviar mensaje en HTML

        mail.To.Add(correo)   'A quien se le envia
        mail.From = New MailAddress("noreply@registrohads.com", "HADS21") 'Quien lo envia
        mail.Subject = "Confirmacion de Registro"   'Asunto del correo
        mail.Body = "Este es un mensaje para que confirme su registro, para validar el registro haga click en el siguiente enlace: <br/><br/>"

        Return mail

    End Function

    'Sub EnviarCorreo:
    ' - Dado un objeto MailMessage (mail) como parametro, 
    ' - Se añaden los datos smtp y se envia 'mail'
    Public Sub EnviarCorreo(ByVal mail As MailMessage, ByRef errorLbl As String)

        Dim smtp As New SmtpClient

        smtp.UseDefaultCredentials = False
        smtp.EnableSsl = True
        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587
        smtp.Credentials = New System.Net.NetworkCredential("kevineitor17@gmail.com", "********")

        Try
            smtp.Send(mail)
            errorLbl = "El email de confirmacion se ha enviado correctamente!"
        Catch excep As Exception
            errorLbl = "ERROR: " & excep.Message
        End Try

    End Sub

    'Function BuscarEmailConf:
    ' - Cambia el valor de 'Confirmado' de la base de datos a TRUE si ese email y el NumConf estan en ella.
    ' - TRUE, si el email y el password de la base de datos coinciden con el email y password pasados como parametro.
    ' - FALSE, en otro caso.
    Public Function BuscarEmailConf(ByVal email As String, ByVal NumConf As Integer, ByRef errorLbl As String) As Boolean

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        'ERROR1 DataReader: No poner 'New' al definir el objeto (Dim).
        Dim dReader As System.Data.SqlClient.SqlDataReader

        Dim emailSql As String = "Vacio"
        Dim numConfSql As Integer = -7

        Dim filasAfectadas As Integer

        StrSql = "SELECT Email,NumConf FROM USERS WHERE Email='" & email & "' AND NumConf='" & NumConf & "'"
        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            dReader = comando.ExecuteReader
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

        dReader.Read()

        If dReader.HasRows Then
            emailSql = dReader.Item("Email")
            numConfSql = dReader.Item("NumConf")
        End If

        dReader.Close()

        If email = emailSql And NumConf = numConfSql Then

            StrSql = "UPDATE USERS SET Confirmado=1 WHERE Email='" & email & "'"
            comando = New SqlClient.SqlCommand(StrSql, Conexion)

            Try
                filasAfectadas = comando.ExecuteNonQuery()
            Catch ex As Exception
                errorLbl = "ERROR: " & ex.Message
            End Try

            Return True
        Else
            Return False
        End If

    End Function

    'Function CompEmailPreg:
    ' - Comprueba que el email esta en la base de datos y Confirmado = True,
    ' - Y se introduce en 'preg' la pregunta secreta.
    ' - TRUE, si esta en la base de datos y Confirmado = True
    ' - FALSE, si el email es invalido o no esta confirmado
    Public Function CompEmailPreg(ByVal email As String, ByRef preg As String, ByRef errorLbl As String) As Boolean

        Dim dReader As System.Data.SqlClient.SqlDataReader

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim confSql As Boolean = False

        ' --- HADS21-USUARIOS (USERS) ---
        'StrSql = "SELECT Email,Pregunta,Confirmado FROM USERS WHERE Email='" & email & "'"
        ' --- AZURE (Usuarios) ---
        StrSql = "SELECT email,pregunta,confirmado FROM Usuarios WHERE email='" & email & "'"

        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            dReader = comando.ExecuteReader
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

        dReader.Read()

        If dReader.HasRows Then
            ' --- HADS21-USUARIOS (USERS) ---
            'preg = dReader.Item("Pregunta")
            'confSql = dReader.Item("Confirmado")
            ' --- AZURE (Usuarios) ---
            preg = dReader.Item("pregunta")
            confSql = dReader.Item("confirmado")
        Else
            errorLbl = "El Email introducido no es valido."
            Return False
        End If

        If confSql = True Then
            Return True
        Else
            errorLbl = "El Email introducido no esta confirmado"
            Return False
        End If

        dReader.Close()

    End Function

    'Function CompRespuesta:
    ' - Comprueba que la Respuesta proporcionada coincida con la almacenada, de ese usuario, en la BD.
    ' - TRUE, si la respuesta es correcta.
    ' - FALSE, en caso contrario.
    Public Function CompRespuesta(ByVal email As String, ByVal res As String, ByRef errorLbl As String) As Boolean

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim resSql As String

        ' --- HADS21-USUARIOS (USERS) ---
        'StrSql = "SELECT Respuesta FROM USERS WHERE Email='" & email & "'"
        ' --- AZURE (Usuarios) ---
        StrSql = "SELECT respuesta FROM Usuarios WHERE email='" & email & "'"

        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            resSql = CStr(comando.ExecuteScalar)
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

        If resSql = res Then
            Return True
        ElseIf resSql = Nothing Then
            errorLbl = "No se reconoce el email, vuelva a intentarlo."
            Return False
        Else
            errorLbl = "Respuesta incorrecta, vuelva a probar"
            Return False
        End If

    End Function

    'Function CambiarPass:
    ' - Cambia el password del email pasado como parametro
    ' - TRUE, si se ha cambiado correctamente.
    ' - FALSE, en caso contrario.
    Public Function CambiarPass(ByVal email As String, ByVal pass As String, ByRef errorlbl As String) As Boolean

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim filasAfectadas As Integer

        ' --- HADS21-USUARIOS (USERS) ---
        'StrSql = "UPDATE USERS SET Password='" & pass & "' WHERE Email='" & email & "'"
        ' --- AZURE (Usuarios) ---
        StrSql = "UPDATE Usuarios SET pass='" & pass & "' WHERE email='" & email & "'"

        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            filasAfectadas = comando.ExecuteNonQuery()
        Catch ex As Exception
            errorlbl = "ERROR: " & ex.Message
        End Try

        If filasAfectadas = 0 Then
            errorlbl = "Error al cambiar el Password, no se reconoce el email, vuelva a intentarlo."
            Return False
        End If
        Return True

    End Function

    'Function InicioSesionCorrecto:
    ' - Comprueba el email y el password pasados como parametro si estan en la base de datos y 'Confirmado' = TRUE,
    ' - 'errorLbl' devuelve 'ninguno', email y pass incorrectos, email no confirmado o error en el DataReader.
    ' - TRUE, si el email esta confirmado.
    ' - FALSE, si el email o password es incorrecto o si el email no ha sido confirmado.
    Public Function InicioSesionCorrecto(ByVal email As String, ByVal pass As String, ByRef errorlbl As String) As Boolean

        'No funciona DataReader local en AZURE.
        Dim dReader As SqlClient.SqlDataReader = Nothing

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim emailSql As String = "Vacio"
        Dim passSql As String = "Vacio"

        ' --- HADS21-USUARIOS (USERS) ---
        'StrSql = "SELECT Email,Password,Confirmado FROM USERS WHERE Email='" & email & "' AND Password='" & pass & "'"
        ' --- AZURE (Usuarios) ---
        StrSql = "SELECT email,pass,confirmado FROM Usuarios WHERE email='" & email & "' AND pass='" & pass & "'"
        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            dReader = comando.ExecuteReader
        Catch ex As Exception
            errorlbl = "ERROR: " & ex.Message.ToString
        End Try

        dReader.Read()

        If dReader.HasRows Then
            ' --- HADS21-USUARIOS (USERS) ---
            'emailSql = dReader.Item("Email")
            'passSql = dReader.Item("Password")
            ' --- AZURE (Usuarios) ---
            emailSql = dReader.Item("email")
            passSql = dReader.Item("pass")
        End If

        If emailSql = email And passSql = pass Then
            ' --- HADS21-USUARIOS (USERS) ---
            'If dReader.Item("Confirmado") = True Then
            ' --- AZURE (Usuarios) ---
            If dReader.Item("confirmado") = True Then
                Return True
            Else
                errorlbl = "No has confirmado tu cuenta."
                Return False
            End If
        Else
            errorlbl = "Email y/o Password introducidos son incorrectos"
            Return False
        End If

        dReader.Close()

    End Function

    Public Function isProfesor(ByVal email As String, ByRef errorLbl As String) As Boolean

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim tipoSql As String

        StrSql = "SELECT tipo FROM Usuarios WHERE email='" & email & "'"
        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            tipoSql = comando.ExecuteScalar.ToString
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
        End Try

        If tipoSql = "P" Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function HEstimadasInstanciar(ByVal codigo As String, ByRef hestimadas As Integer, ByRef errorLbl As String) As Boolean

        Dim cmd As New SqlCommand("SELECT HEstimadas FROM TareasGenericas WHERE Codigo='" & codigo & "'", Conexion)

        Try
            hestimadas = CInt(cmd.ExecuteScalar)
        Catch ex As Exception
            errorLbl = "ERROR: " & ex.Message
            Return False
        End Try

        Return True

    End Function

    ' --------------------
    ' --- ENCRYPTACION ---
    ' --------------------

    Private MD5 As New MD5CryptoServiceProvider
    Private DES As New TripleDESCryptoServiceProvider

    'Function Encrypt3DSMD5:
    ' - Encripta el valor que se le pasa como parametro (strPlano),
    ' - Devuelve strPlano encriptado en formato String
    Public Function Encrypt3DSMD5(ByVal strPlano As String) As String
        Dim key As String = "keyEncrypt3DSMD5"
        DES.Key = MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(key))
        DES.Mode = CipherMode.ECB
        Dim Buffer As Byte() = ASCIIEncoding.ASCII.GetBytes(strPlano)
        Return Convert.ToBase64String(DES.CreateEncryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))
    End Function

    'Function Decrypt3DSMD5:
    ' - Desencripta el valor que se le pasa como parametro (strEncrypt),
    ' - Devuelve strEncrypt desencriptado en formato String
    Public Function Decrypt3DSMD5(ByVal strEncrypt As String) As String
        Dim key As String = "keyEncrypt3DSMD5"
        DES.Key = MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(key))
        DES.Mode = CipherMode.ECB
        Dim Buffer As Byte() = Convert.FromBase64String(strEncrypt)
        Return ASCIIEncoding.ASCII.GetString(DES.CreateDecryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))

    End Function

    'Function InicioSesionCorrectoEncrypt:
    ' - Comprueba el email y el password pasados como parametro si estan en la base de datos y 'Confirmado' = TRUE,
    ' - 'errorLbl' devuelve 'ninguno', email y pass incorrectos, email no confirmado o error en el DataReader.
    ' - TRUE, si el email esta confirmado.
    ' - FALSE, si el email o password es incorrecto o si el email no ha sido confirmado.
    Public Function InicioSesionCorrectoEncrypt(ByVal email As String, ByVal pass As String, ByRef errorlbl As String) As Boolean

        'No funciona DataReader local en AZURE.
        Dim dReader As SqlClient.SqlDataReader = Nothing

        Dim comando As New SqlClient.SqlCommand
        Dim StrSql As String

        Dim emailSql As String = "Vacio"
        Dim passSql As String = "Vacio"

        Dim passEncrypt As String = Encrypt3DSMD5(pass)

        StrSql = "SELECT email,pass,confirmado FROM Usuarios WHERE email='" & email & "' AND pass='" & passEncrypt & "'"
        comando = New SqlClient.SqlCommand(StrSql, Conexion)

        Try
            dReader = comando.ExecuteReader
        Catch ex As Exception
            errorlbl = "ERROR: " & ex.Message.ToString
        End Try

        dReader.Read()

        If dReader.HasRows Then
            emailSql = dReader.Item("email")
            passSql = dReader.Item("pass")
        End If

        passSql = Decrypt3DSMD5(passSql)

        If emailSql = email And passSql = pass Then
            If dReader.Item("confirmado") = True Then
                Return True
            Else
                errorlbl = "No has confirmado tu cuenta."
                Return False
            End If
        Else
            errorlbl = "Email y/o Password introducidos son incorrectos"
            Return False
        End If

        dReader.Close()

    End Function

End Class
