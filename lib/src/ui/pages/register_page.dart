import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

// Verificar lo necesario para la contraseña de seguridad, modificar los años y los datos para que se metan bien

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  final _formRegisterKey = GlobalKey<FormState>();

  Future<void>? initDatabase;

  late TextEditingController _nombres;
  late TextEditingController _paterno;
  late TextEditingController _materno;
  late TextEditingController _email;
  late TextEditingController _nacimiento;
  late TextEditingController _telefono;
  late TextEditingController _password;
  late TextEditingController _confirmationPassword;

  Database? _database;

  Future<void> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(documentsDirectory.path, 'usuarios.db');

    _database = await openDatabase(
      dbPath,
      version: 2,
      onCreate: (db, version) {
        // Code to create tables if they don't exist
        db.execute('''
        CREATE TABLE IF NOT EXISTS user (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          apellidoPaterno TEXT,
          apellidoMaterno TEXT,
          email TEXT,
          nacimiento DATE,
          telefono TEXT,
          password TEXT
        )
      ''');
      },
    );

    print('Database Path: $dbPath'); // Imprime la ruta de la base de datos
  }

  @override
  initState() {
    initDatabase = _initDatabase();
    _nombres = TextEditingController(text: '');
    _paterno = TextEditingController(text: '');
    _materno = TextEditingController(text: '');
    _email = TextEditingController(text: '');
    _nacimiento = TextEditingController(text: '');
    _telefono = TextEditingController(text: '');
    _password = TextEditingController(text: '');
    _confirmationPassword = TextEditingController(text: '');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initDatabase,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Cargando");
          } else {
            if (_database != null) {
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
                      child: Column(
                    children: [
                      Image.asset(
                        "assets/landing.png",
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Crea tu cuenta",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(149, 84, 5, 1)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Form(
                          key: _formRegisterKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: _nombres,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.person),
                                    hintText: 'Ej. María Carla',
                                    label: Text('Nombre(s)*'),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3 ||
                                        value.length > 20 ||
                                        RegExp(r'[#$%&/*!]').hasMatch(value)) {
                                      return 'Ingresa un nombre válido (sin caracteres especiales)';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                        controller: _paterno,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Ej. González',
                                          label: Text('Apellido Paterno*'),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 3 ||
                                              value.length > 20 ||
                                              RegExp(r'[#$%&/*!]')
                                                  .hasMatch(value)) {
                                            return 'Ingresa un apellido paterno válido (sin caracteres especiales)';
                                          }
                                          return null;
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                        controller: _materno,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Ej. Rodríguez',
                                          label: Text('Apellido Materno*'),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 3 ||
                                              value.length > 20 ||
                                              RegExp(r'[#$%&/*!]')
                                                  .hasMatch(value)) {
                                            return 'Ingresa un apellido materno válido (sin caracteres especiales)';
                                          }
                                          return null;
                                        }),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  controller: _email,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.email),
                                    hintText: 'Ej. usuario@gmail.com',
                                    label: Text('Email*'),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Ingresa un email válido';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _nacimiento,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.date_range),
                                  hintText: 'Ej. 1/01/2000',
                                  border: OutlineInputBorder(),
                                  label: Text('Fecha de nacimiento'),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  controller: _telefono,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.phone),
                                    border: OutlineInputBorder(),
                                    hintText: 'Ej. 4421869878',
                                    label: Text('Teléfono*'),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length != 10 ||
                                        !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      return 'Ingresa un número de teléfono válido (solo números)';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 8,
                              ),
                              //VOY AQUI
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                        controller: _password,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text('Contraseña*'),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 8 ||
                                              value.length > 20 ||
                                              !RegExp(r'[A-Z]')
                                                  .hasMatch(value) ||
                                              !RegExp(r'[0-9]')
                                                  .hasMatch(value) ||
                                              !RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                                  .hasMatch(value)) {
                                            return 'Ingresa una contraseña válida (entre 8 y 20 caracteres, al menos una mayúscula, un número y un caracter especial)';
                                          }
                                          return null;
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                        controller: _confirmationPassword,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText:
                                              'Vuelva a escribir su contraseña',
                                          label: Text('Repita su contraseña*'),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value == '') {
                                            return 'Ambos campos de contrasñea son obligatorios';
                                          }
                                          if (value != _password.value.text) {
                                            return 'Las contraseñas no concuerdan';
                                          }
                                          return null;
                                        }),
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _insertData();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(219, 166, 123, 1)),
                          foregroundColor: MaterialStateProperty.all(
                              Colors.black), // Establece el color del texto
                        ),
                        child: const Text("Crear cuenta"),
                      ),
                    ],
                  )),
                ),
              );
            } else {
              return Text("La base no se pudo inicializar");
            }
          }
        });
  }

  Future<void> _insertData() async {
    if (_formRegisterKey.currentState?.validate() ?? false) {
      try {
        // Verificar si el email ya existe
        final existingUserWithEmail = await _database!.rawQuery(
          'SELECT * FROM user WHERE email = ?',
          [_email.text],
        );

        if (existingUserWithEmail.isNotEmpty) {
          ScaffoldMessenger.of(_formRegisterKey.currentContext!).showSnackBar(
            const SnackBar(
              content: Text('Este email ya está registrado. Utiliza otro.'),
              duration: Duration(seconds: 2),
            ),
          );
          return; // Detener la ejecución si el email ya existe
        }

        // Verificar si el número de teléfono ya existe
        final existingUserWithPhone = await _database!.rawQuery(
          'SELECT * FROM user WHERE telefono = ?',
          [_telefono.text],
        );

        if (existingUserWithPhone.isNotEmpty) {
          ScaffoldMessenger.of(_formRegisterKey.currentContext!).showSnackBar(
            const SnackBar(
              content: Text(
                  'Este número de teléfono ya está registrado. Utiliza otro.'),
              duration: Duration(seconds: 2),
            ),
          );
          return; // Detener la ejecución si el número de teléfono ya existe
        }

        // Usar el formateador de fecha para analizar la cadena
        DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(_nacimiento.text);
        String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

        print(
            'Database Path: ${_database!.path}'); // Imprime la ruta de la base de datos

        await _database!.transaction((txn) async {
          await txn.rawInsert('''
          INSERT INTO user (
            nombre, apellidoPaterno, apellidoMaterno,
            email, nacimiento, telefono, password
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
            _nombres.text,
            _paterno.text,
            _materno.text,
            _email.text,
            formattedDate,
            _telefono.text,
            _password.text,
          ]);
        });

        // Después de la inserción, selecciona y muestra los registros
        await _selectData();

        ScaffoldMessenger.of(_formRegisterKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text('Cuenta creada exitosamente'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        print('Error al crear la cuenta: $e');
        ScaffoldMessenger.of(_formRegisterKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text('Error al crear la cuenta. Inténtalo de nuevo.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _selectData() async {
    try {
      List<Map<String, dynamic>> results =
          await _database!.rawQuery('SELECT * FROM user');
      results.forEach((row) {
        print('Registro: $row');
      });
    } catch (e) {
      print('Error al seleccionar datos: $e');
    }
  }

  @override
  void dispose() {
    _nombres.dispose();
    _paterno.dispose();
    _materno.dispose();
    _email.dispose();
    _nacimiento.dispose();
    _telefono.dispose();
    _password.dispose();
    _confirmationPassword.dispose();
    super.dispose();
  }
}
