import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() {
  runApp(const HadushDice());
}

class HadushDice extends StatelessWidget {
  const HadushDice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hadush Dice',
      theme: ThemeData.dark(),
      home: const PlayerSetupScreen(),
    );
  }
}

class PlayerSetupScreen extends StatefulWidget {
  const PlayerSetupScreen({super.key});

  @override
  State<PlayerSetupScreen> createState() => _PlayerSetupScreenState();
}

class _PlayerSetupScreenState extends State<PlayerSetupScreen> {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  void startGame() {
    final player1 = player1Controller.text.trim();
    final player2 = player2Controller.text.trim();

    if (player1.isEmpty || player2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Both players must enter their names!'),
          backgroundColor: Color.fromARGB(255, 202, 190, 189),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(player1: player1, player2: player2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadush Dice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Player Names',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: player1Controller,
              decoration: const InputDecoration(
                labelText: 'Player 1 Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: player2Controller,
              decoration: const InputDecoration(
                labelText: 'Player 2 Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: startGame,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
