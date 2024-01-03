import 'package:appnotas/src/ui/pages/landing_page.dart';
import 'package:appnotas/src/ui/pages/remember_password.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class EmailLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailLoginPageState();
  }
}

class EmailLoginPageState extends State<EmailLoginPage> {
  Future<void>? initDatabase;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _controller;
  late TextEditingController _controller2;

  late Database _database;

  @override
  initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    initDatabase = _initDatabase();
  }

  Future<void> _initDatabase() async {
    try {
      var databasesPath = await getApplicationDocumentsDirectory();
      String path = join(databasesPath.path, 'usuarios.db');

      _database = await openDatabase(path);

      print('Database opened successfully');
    } catch (e) {
      print('Error opening the database: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/landing.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Inicia sesión con correo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(149, 84, 5, 1)),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.mail),
                        hintText: 'Ej. usuario@gmail.com',
                        label: Text('Email'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == '') {
                          return 'El campo email es obligatorio';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _controller2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Contraseña'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == '') {
                          return 'El campo de contraseña es obligatorio';
                        }
                        return null;
                      }),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(
                      color: Color.fromRGBO(149, 84, 5, 1),
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RememberPassword())); //Remember password
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _verifyCredentials(context);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(219, 166, 123, 1)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text("Iniciar sesión"),
              ),
            ]),
          ),
        ));
  }

  Future<void> _verifyCredentials(BuildContext context) async {
    List<Map<String, dynamic>> tables = await _database
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
    print('Tablas en la base de datos:');
    for (var table in tables) {
      print(table['name']);
    }

    try {
      await initDatabase;
      // Resto del código
    } catch (e) {
      print('Error durante la inicialización de la base de datos: $e');
      // Puedes manejar el error según tus necesidades
    }

    if (initDatabase == null) {
      print('Esperando la inicialización de la base de datos...');
      return; // Evitar verificaciones hasta que la base de datos esté inicializada
    }

    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Obtener valores de los controladores
        String email = _controller.text;
        String password = _controller2.text;

        // Imprimir las credenciales antes de la consulta
        print('Email: $email, Password: $password');

        // Consultar todos los usuarios en la base de datos
        List<Map<String, dynamic>> allUsers =
            await _database.rawQuery('SELECT * FROM user');

        // Imprimir todos los usuarios
        print('Registros en la base de datos:');
        for (var user in allUsers) {
          print(user);
        }

        // Realizar la consulta SQL
        List<Map<String, dynamic>> results = await _database.rawQuery(
          'SELECT * FROM user WHERE email = ?',
          [email],
        );

        // Verificar si se encontraron resultados
        if (results.isNotEmpty) {
          // Comparar la contraseña en Dart
          if (results.first['password'] == password) {
            print('Credenciales válidas. Usuario encontrado: ${results.first}');
            // Redirigir a main_page.dart
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LandingPage())); //MAIN PAGE
          } else {
            print('Contraseña incorrecta. Verifica tus datos.');
            // Mostrar un SnackBar con un mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Contraseña incorrecta. Verifica tus datos.'),
                duration: Duration(seconds: 3),
              ),
            );
            // Aquí puedes manejar la contraseña incorrecta
          }
        } else {
          print('Credenciales inválidas. Usuario no encontrado.');
          // Mostrar un SnackBar con un mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario no encontrado. Verifica tus datos.'),
              duration: Duration(seconds: 3),
            ),
          );
          // Aquí puedes manejar el usuario no encontrado
        }
      } catch (e) {
        print('Error al verificar las credenciales: $e');
        // Aquí puedes manejar cualquier error que ocurra durante la verificación
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
