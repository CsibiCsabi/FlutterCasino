import 'dart:math';
import 'package:flutter/material.dart';
import 'package:slot_machine/customs/gradient_button.dart';
import 'package:slot_machine/customs/machine.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List<String>> datas = [
    ['1', '1', '2'],
    ['2', '2', '3'],
    ['3', '2', '1']
  ];

  List<String> possibleValues = ['1', '2', '3'];

  final random = Random();

  int currentBet = 0;

  void roll() {
    currentBet = bet;
    setState(() {
      money -= bet;
      List<String> row = [];
      datas = [];
      for (int i = 0; i < 3; i++) {
        row = [];
        for (int k = 0; k < 3; k++) {
          row.add(possibleValues[random.nextInt(possibleValues.length)]);
        }
        datas.add(row);
      }
    });
    check();
  }

  int rowCount = 0;
  int columnCount = 0;
  int diagonalCount = 0;

  void check() {
    winnings = 0;
    rowCount = 0;
    columnCount = 0;
    diagonalCount = 0;
    setState(() {
      for (int i = 0; i < 3; i++) {
        if (datas[i][0] == datas[i][1] && datas[i][1] == datas[i][2]) {
          rowCount++;
        }
        if (datas[0][i] == datas[1][i] && datas[0][i] == datas[2][i]) {
          columnCount++;
        }
      }
      if (datas[0][0] == datas[1][1] && datas[0][0] == datas[2][2]) {
        diagonalCount++;
      }
      if (datas[0][2] == datas[1][1] && datas[0][2] == datas[2][0]) {
        diagonalCount++;
      }
      winnings += bet * columnCount;
      winnings += bet * rowCount;
      winnings += bet * diagonalCount;
      money += winnings;
    });
  }

  int winnings = 0;

  int bet = 10;

  int betCounter = 0;

  List<int> betValues = [10, 20, 50, 100, 200, 500];

  void changeBet() {
    setState(() {
      betCounter++;
      if (betCounter == betValues.length) {
        betCounter = 0;
      }
      bet = betValues[betCounter];
    });
  }

  int money = 1000;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 91, 12, 7),
        ),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Text("This is a slotmachine!", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
          Machine(
            datas: datas,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: const Color.fromARGB(160, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  rowCount == 1
                      ? 'You got 1 Row!'
                      : 'You got ${rowCount.toString()} Rows!',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  columnCount == 1
                      ? 'You got 1 Column!'
                      : 'You got ${columnCount.toString()} Columns!',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  diagonalCount == 1
                      ? 'You got 1 Diagonal!'
                      : 'You got ${diagonalCount.toString()} Diagonals!',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(winnings-currentBet==0 ? "You came out even!" : winnings - currentBet < 0 ? "You've lost ${(currentBet-winnings).toString()}\$" : "You've won ${(winnings-currentBet).toString()}\$", style: const TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          GradientButton(onPressed: roll, data: "Spin!"),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(150, 255, 255, 255)
            ),
            child: Text("Your money: ${money.toString()}", style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10,),
          GradientButton(onPressed: changeBet, data: "Change Bet!"),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(150, 255, 255, 255)
            ),
            child: Text("Bet: ${bet.toString()}", style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
