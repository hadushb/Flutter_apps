import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 23,
          foreground: Paint()
            ..shader = ui.Gradient.linear(
              const Offset(0, 20),
              const Offset(190, 20),
              <Color>[
                const Color.fromARGB(255, 252, 79, 165),
                const Color.fromARGB(255, 108, 79, 211),
              ],
            )),
    );
  }
}
