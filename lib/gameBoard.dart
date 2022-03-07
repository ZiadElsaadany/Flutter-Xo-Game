import 'package:flutter/material.dart';
import 'package:xo/BoardButton.dart';

class GameBoard extends StatefulWidget {
  static String routeName = "GameBoard";

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  List<String> boardState = [
    '', '', '',
    '', '', '',
   '', '', ''];
  String player1 = '';

  String player2 = '';

  int player1Score = 0;

  int player2Score = 0;

  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("X O"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player1Name} (X)",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "Score: $player1Score",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player2Name} (O)",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "Score: $player2Score",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardState[0], 0, onButtonClick),
                BoardButton(boardState[1], 1, onButtonClick),
                BoardButton(boardState[2], 2, onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardState[3], 3, onButtonClick),
                BoardButton(boardState[4], 4, onButtonClick),
                BoardButton(boardState[5], 5, onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(boardState[6], 6, onButtonClick),
                BoardButton(boardState[7], 7, onButtonClick),
                BoardButton(boardState[8], 8, onButtonClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      //player 1 turn (X)
      boardState[index] = 'X';
      print(counter);
      counter++;
    } else {
      //player 2
      boardState[index] = 'O';
      print(counter);
      counter++;
    }
    if (checkWinner('X')!) {
      //X is winner
      player1Score += 5;
      initBoard();
    } else if (checkWinner('O')!) {
      //O is Winner
      player2Score += 5;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool? checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      //i = 0   , i =3  , i=6  rows
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      //column
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }
}

class GameBoardArgs {
  String player1Name;

  String player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}
