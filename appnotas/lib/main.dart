import 'package:appnotas/src/core/constants/data.dart';
import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:appnotas/src/ui/pages/error_page.dart';
import 'package:appnotas/src/ui/pages/home_page.dart';
import 'package:appnotas/src/ui/pages/landing_page.dart';
import 'package:appnotas/src/ui/pages/note_page.dart';
import 'package:appnotas/src/ui/pages/private_notes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => ErrorPage(details: details);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ThemeController.instance.initTheme(),
      builder: (snapshot, context) {
        return MaterialApp(
          routes: {
            HomePage.HOME_PAGE_ROUTE: (context) => HomePage(),
            ErrorPage.ERROR_PAGE_ROUTE: (context) => ErrorPage(),
            LandingPage.LANDING_PAGE_ROUTE: (context) => LandingPage(),
            NotePage.NOTE_PAGE_ROUTE: (context) => NotePage(),
            NotePrivatePage.NOTE_PRIVATE_PAGE_ROUTE: (context) =>
                NotePrivatePage(),
          },
          debugShowCheckedModeBanner: false,
          title: Constants.MAIN_TITLE,
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          initialRoute: LandingPage.LANDING_PAGE_ROUTE,
          home: Container(),
        );
      },
    );
  }
}
