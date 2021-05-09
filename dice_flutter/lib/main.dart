import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen.shade100,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.lightGreen.shade200,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _firstDiceNumber = 1;
  int _secondDiceNumber = 6;

  void _rollDice() {
    Random random = Random();
    setState(() {
      _firstDiceNumber = random.nextInt(6) + 1;
      _secondDiceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  _rollDice();
                },
                child: Image.asset('images/dice$_firstDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  _rollDice();
                },
                child: Image.asset('images/dice$_secondDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
