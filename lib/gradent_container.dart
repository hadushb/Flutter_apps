import 'package:flutter/material.dart';
import 'package:intellegent_call_anti_theft/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;
  var activeDiceImage = 'assets/images/dice-1.png';
  void rollDice() {
    activeDiceImage = 'assets/images/dice-4.png';
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});
//   final List<color> colors;
//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors:colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: Center(
//         child: StyledText('intelligent call anti-theft'),
//       ),
//     );
//   }
// }
