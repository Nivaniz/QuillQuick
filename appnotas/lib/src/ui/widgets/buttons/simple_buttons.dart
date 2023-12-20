import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final String title;
  final bool primaryColor;
  final Icon? icon;
  final Function()? onTap;
  const MediumButton({
    Key? key,
    this.title = "",
    this.primaryColor = true,
    this.onTap,
    this.icon,
  }) : super(key: key);

  Color getButtonColor() {
    return this.primaryColor
        ? ThemeController.instance.primaryButton()
        : ThemeController.instance.secondaryButton();
  }

  Color getTextColor() {
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
            color: getButtonColor(), borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(icon as IconData?, color: getTextColor())
                : SizedBox(),
            SizedBox(width: icon != null ? 8 : 0),
            Text(
              title,
              style: TextStyle(color: getTextColor(), fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
