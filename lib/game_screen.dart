import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intellegent_call_anti_theft/style_text.dart';

final randomizer = Random();

class GameScreen extends StatefulWidget {
  final String player1;
  final String player2;

  const GameScreen({required this.player1, required this.player2, super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var currentDiceRoll = 1;
  int player1Score = 0;
  int player2Score = 0;
  String winner = '';
  int currentPlayer = 1;

  void rollDice() {
    if (winner.isNotEmpty) return;

    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;

      if (currentPlayer == 1) {
        player1Score += currentDiceRoll;
        if (player1Score >= 50) {
          winner = '${widget.player1} Wins!';
        } else {
          currentPlayer = 2;
        }
      } else if (currentPlayer == 2) {
        player2Score += currentDiceRoll;
        if (player2Score >= 50) {
          winner = '${widget.player2} Wins!';
        } else {
          currentPlayer = 1;
        }
      }
    });
  }

  void resetGame() {
    setState(() {
      currentDiceRoll = 1;
      player1Score = 0;
      player2Score = 0;
      winner = '';
      currentPlayer = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const StyledText('Hadush Dice'),
      ),
      body: GradientContainer(
        const Color.fromARGB(255, 170, 223, 154), // First gradient color
        const Color.fromARGB(31, 230, 219, 221),
        // Second gradient color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (winner.isEmpty)
                StyledText(
                  'Current Player: ${currentPlayer == 1 ? widget.player1 : widget.player2}',
                ),
              const SizedBox(height: 20),
              if (winner.isEmpty)
                ElevatedButton(
                  onPressed: currentPlayer == 1 ? rollDice : null,
                  child: StyledText('${widget.player1} Roll'),
                ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/dice-$currentDiceRoll.png',
                width: screenWidth * 0.4,
              ),
              const SizedBox(height: 20),
              if (winner.isEmpty)
                ElevatedButton(
                  onPressed: currentPlayer == 2 ? rollDice : null,
                  child: StyledText('${widget.player2} Roll'),
                ),
              if (winner.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    StyledText(
                      winner,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: resetGame,
                      child: const StyledText('Play Again'),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      StyledText(widget.player1),
                      StyledText("$player1Score"),
                    ],
                  ),
                  Column(
                    children: [
                      StyledText(widget.player2),
                      StyledText("$player2Score"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Widget child;

  const GradientContainer(this.color1, this.color2,
      {super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
