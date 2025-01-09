import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;
  int player1Score = 0;
  int player2Score = 0;
  String winner = '';

  void rollDiceForPlayer1() {
    if (winner.isNotEmpty) return; // Stop if there's a winner
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      player1Score += currentDiceRoll;
      checkWinner();
    });
  }

  void rollDiceForPlayer2() {
    if (winner.isNotEmpty) return; // Stop if there's a winner
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      player2Score += currentDiceRoll;
      checkWinner();
    });
  }

  void checkWinner() {
    if (player1Score >= 50) {
      winner = 'Player 1 Wins!';
    } else if (player2Score >= 50) {
      winner = 'Player 2 Wins!';
    }
  }

  void resetGame() {
    setState(() {
      currentDiceRoll = 1;
      player1Score = 0;
      player2Score = 0;
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (winner.isEmpty)
          ElevatedButton(
            onPressed: rollDiceForPlayer1,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: const Text('Player 1 Roll'),
          ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: screenWidth * 0.4,
        ),
        const SizedBox(height: 20),
        if (winner.isEmpty)
          ElevatedButton(
            onPressed: rollDiceForPlayer2,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: const Text('Player 2 Roll'),
          ),
        if (winner.isNotEmpty)
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                winner,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetGame,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('Play Again'),
              ),
            ],
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Player 1",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$player1Score",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Player 2",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$player2Score",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
