import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gameBoard.dart';

class Information extends StatelessWidget {
  @override
  static String routeName ="Information";
  String player1Name ='' ;
  String player2Name ='' ;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome to XO game")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(
            flex: 1,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
             onChanged: (value){
               player1Name=value;
             },
               decoration: InputDecoration(
                labelText: "Player 1 Name ",
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black ,
                ),
                filled: true,
                fillColor: Colors.white,
                border:  OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(20.0)
                ),
               ),

            ),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            child: TextField(
             onChanged: (value){
               player2Name=value;
             },
              decoration: InputDecoration(
                labelText: "Player 2 Name  ",
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black ,
                ),
                filled: true,
                fillColor: Colors.white,
                border:  OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(20.0)
              ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style:ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.red)
            )
    )
              ),
              child: Text("Play" , style: TextStyle(fontSize: 20.0
              ),) ,
              onPressed: (){
                Navigator.of(context).pushNamed(GameBoard.routeName,
                    arguments: GameBoardArgs(player1Name: player1Name, player2Name: player2Name));
              },
            ),
          ),
          Spacer(
            flex: 2,
  ),

  ],
  ),
  );
}
}
