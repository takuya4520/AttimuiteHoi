import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const AttimuiteHoi(),
    );
  }
}

class AttimuiteHoi extends StatefulWidget {
  const AttimuiteHoi({Key? key}) : super(key: key);

  @override
  State<AttimuiteHoi> createState() => _AttimuiteHoiState();
}

class _AttimuiteHoiState extends State<AttimuiteHoi> {
  int winCounter = 0;
  int succesCounter = 0;
  int maxCounter = 0;
  String myHand = '๐';
  String computerHand = '๐';
  String result = '';

  void selectHand(String selectedHand) {
    if (result == 'ใใ่ชฟๅญใ๏ผ' || result == '') {
      myHand = selectedHand;
      generateComputerHand();
      judge();
      setState(() {});
    }
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(4);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '๐';
      case 1:
        return '๐';
      case 2:
        return '๐';
      case 3:
        return '๐';
      default:
        return '๐';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = 'ใใใใใๆฎๅฟต๏ผ';
    } else {
      result = 'ใใ่ชฟๅญใ๏ผ';
      winCounter++;
      if (winCounter == 5) {
        succesCounter++;
      }
      if (maxCounter < winCounter) {
        maxCounter = winCounter;
      }
    }
  }

  void reset() {
    myHand = '๐';
    computerHand = '๐';
    result = '';
    winCounter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'ใใฃใกๆๅทฎใใกใใใใใฎใ๏ผ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    '็ฎๆใ5้ฃๅ๏ผ',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '5้ฃๅ้ๆๅๆฐ๏ผ$succesCounter',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ๆๅคง้ฃ็ถๅๆฐ๏ผ$maxCounter',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '$winCounterๅ้ฃๅไธญ',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              '็ธๆใจ้ใๆนๅใๆใใ๏ผ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              computerHand,
              style: const TextStyle(fontSize: 40),
            ),
            const Text(
              '็ธๆ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              result,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              myHand,
              style: const TextStyle(fontSize: 40),
            ),
            const Text(
              '่ชๅ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: const Text(
                    '๐',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: const Text(
                    '๐',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: const Text(
                    '๐',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: const Text(
                    '๐',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            if (result == 'ใใใใใๆฎๅฟต๏ผ')
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: const Text(
                      'reset',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text('resetใๆผใใฆใใไธๅ๏ผ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
          ],
        )));
  }
}
