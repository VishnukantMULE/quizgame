import 'package:flutter/material.dart';
import 'package:quizgame/theme/appcolors.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AppPrimaryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.primary,
            side: const BorderSide(color: Colors.purpleAccent, width: 2),
            fixedSize: Size(MediaQuery.of(context).size.width - 160, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}
