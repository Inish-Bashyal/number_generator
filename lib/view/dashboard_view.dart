import 'dart:math';

import 'package:flutter/material.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int num1 = 0;
  int num2 = 0;
  int round = 0;
  bool displayScore = false;
  int wrongScore = 0;
  int rightScore = 0;
  void newRound() {
    setState(() {
      num1 = Random().nextInt(100);
      num2 = Random().nextInt(100);

      if (num1 != num2) {
        round++;
        displayScore = false;
      } else {
        num1 = Random().nextInt(100);
        num2 = Random().nextInt(100);
        round++;
        displayScore = false;
      }
    });
  }

  void selectNumber(int number) {
    setState(() {
      if (num1 > num2 && number == 1) {
        rightScore++;
      } else if (num2 > num1 && number == 2) {
        rightScore++;
      } else {
        wrongScore++;
      }
      if (round == 10) {
        displayScore = true;
      } else {
        newRound();
      }
    });
  }

  void reset() {
    setState(() {
      round = 0;
      wrongScore = 0;
      rightScore = 0;
      newRound();
    });
  }

  @override
  void initState() {
    super.initState();
    newRound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Number Genertor',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: displayScore
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Final Score:',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Right Answer : $rightScore',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Wrong Answer : $wrongScore',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: reset,
                    child: const Text('Play Again'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Pick the Greatest Number',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Round $round',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => selectNumber(1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            '$num1',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => selectNumber(2),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            '$num2',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
