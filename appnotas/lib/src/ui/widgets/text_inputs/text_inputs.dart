import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

Color fontColor() {
  return ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
}

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final bool private;
  final Function(String)? textEntry;
  final Function()? action;
  final IconData? icon;

  const TextInput(
      {Key? key,
      this.controller,
      this.title = "",
      this.textEntry,
      this.action,
      this.icon = Icons.check,
      this.private = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: fontColor())),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              obscureText: private,
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: action != null
                      ? IconButton(onPressed: action, icon: Icon(icon))
                      : SizedBox(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}

class LargeTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final bool private;
  final Function(String)? textEntry;

  const LargeTextInput(
      {Key? key,
      this.controller,
      this.title = "",
      this.textEntry,
      this.private = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: fontColor())),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              obscureText: private,
              controller: controller,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
