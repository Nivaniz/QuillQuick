import 'package:appnotas/src/core/constants/data.dart';
import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:appnotas/src/ui/configure.dart';
import 'package:appnotas/src/ui/pages/landing_page.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails? details;

  static final ERROR_PAGE_ROUTE = "error_page";

  ErrorPage({Key? key, this.details}) : super(key: key);
  Color fontColor() =>
      !ThemeController.instance.brightnessValue ? Colors.white : Colors.black;

  String getException() {
    if (details != null) {
      final exception = details?.exceptionAsString();
      if (exception != null) {
        return exception;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeController.instance.background(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeController.instance.background(),
        title: Text(
          "Error",
          style: TextStyle(color: fontColor()),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: Configure.BACKGROUND_LIGHT,
                  borderRadius: BorderRadius.circular(200)),
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/error.png")),
                  )),
            ),
            Column(
              children: [
                Text(
                  Constants.ERROR_MESSAGE,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: fontColor()),
                ),
                details != null
                    ? Text(
                        getException(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                      )
                    : Container(),
                TextButton(
                  child: Text("Regresar al inicio"),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
                      LandingPage.LANDING_PAGE_ROUTE, (route) => false),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
