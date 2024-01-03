import "package:flutter/material.dart";

class RememberPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RememberPasswordState();
  }
}

class RememberPasswordState extends State<RememberPassword> {
  late TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController(text: '');
    super.initState();
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/landing.png",
            width: 250,
            height: 250,
          ),
          const Text(
            "Recuperar contraseña",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(149, 84, 5, 1)),
          ),
          const SizedBox(
            height: 25,
          ),
          Form(
              child: Form(
            child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.mail),
                  hintText: 'Ej. usuario@gmail.com',
                  label: Text('Email *'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value == '') {
                    return 'El campo email es obligatorio';
                  }
                  return null;
                }),
          )),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 50)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(219, 166, 123, 1)),
              foregroundColor: MaterialStateProperty.all(
                  Colors.black), // Establece el color del texto
            ),
            child: const Text("Enviar correo"),
          ),
          const SizedBox(height: 24),
          const Text(
            "Recuerda no compartir tus contraseñas de forma publica y cambiarlas frecuentemente",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }
}
