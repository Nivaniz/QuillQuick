import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final String title;
  final bool primaryColor;
  final IconData? iconData;
  final Function()? onTap;
  const MediumButton({
    Key? key,
    this.title = "",
    this.primaryColor = true,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  Color getColor() {
    return this.primaryColor
        ? ThemeController.instance.primaryButton()
        : ThemeController.instance.secondaryButton();
  }

  Color getColorText() {
    if (!this.primaryColor) return Colors.black;
    return !ThemeController.instance.brightnessValue
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: getColor(), borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Icon(iconData,
                    color: getColorText()) // Cambiado de icon a iconData
                : SizedBox(),
            SizedBox(width: iconData != null ? 8 : 0),
            Text(
              title,
              style: TextStyle(color: getColorText(), fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
