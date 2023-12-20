import 'package:appnotas/src/core/constants/data.dart';
import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:appnotas/src/core/services/preferences_service.dart';
import 'package:appnotas/src/ui/pages/home_page.dart';
// ignore: unused_import
import 'package:appnotas/src/ui/pages/private_notes.dart';
import 'package:appnotas/src/ui/widgets/buttons/simple_buttons.dart';
import 'package:appnotas/src/ui/widgets/loading_widget/loading_widget.dart';
import 'package:appnotas/src/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  static final LANDING_PAGE_ROUTE = "landing_page";
  // ignore: unused_field
  final PreferencesService _preferencesService = PreferencesService.instance;

  Widget _image() {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/landing.png"))));
  }

  Future<void> initMethods() async {}

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = ThemeController.instance;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors
              .white, // theme.background aquí si la imagen no tiene fondo para que sea el mismo de todas mis pantallas
          body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: _image()),
                  Text(Constants.MAIN_TITLE,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 28)),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20), // Ajusta el valor según sea necesario
                    child: Text(
                      Constants.SUB_TITLE,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize:
                            13, // Puedes ajustar el tamaño según tus preferencias
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: MediumButton(
                        title: "Entrar",
                        onTap: () async {
                          LoadingWidgetController.instance.loading();
                          await initMethods();
                          LoadingWidgetController.instance.close();
                          Navigator.pushNamed(
                              context, HomePage.HOME_PAGE_ROUTE);
                        }),
                  )
                ],
              )),
        ),
        ValueListenableBuilder(
            valueListenable: LoadingWidgetController.instance.loadingNotifier,
            builder: (context, bool value, Widget? child) {
              return value ? const LoadingWidget() : const SizedBox();
            })
      ],
    );
  }
}
