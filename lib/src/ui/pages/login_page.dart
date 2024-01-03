import 'package:flutter/material.dart';
import "package:social_login_buttons/social_login_buttons.dart";
import "package:appnotas/src/ui/pages/email_login_page.dart";
import "package:appnotas/src/ui/pages/register_page.dart";

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static final LOGIN_PAGE = "login_page";

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
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
        color: Colors.white, // Establece el color de fondo del Scaffold
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/landing.png",
              width: 250,
              height: 250,
            ),
            const Text(
              "Bienvenido a QuillQuick",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(149, 84, 5, 1)),
            ),
            Column(
              children: [
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.facebook,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: const Text(
                    "Iniciar sesión con correo",
                    style: TextStyle(
                        color: Color.fromRGBO(149, 84, 5, 1),
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailLoginPage()));
                  },
                ),
                const Text("o"),
                GestureDetector(
                  child: const Text(
                    "Crear cuenta",
                    style: TextStyle(
                        color: const Color.fromRGBO(149, 84, 5, 1),
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
