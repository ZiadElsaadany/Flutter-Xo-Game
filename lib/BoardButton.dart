import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text ;
  Function onButtonClick ;
  int index;

  BoardButton(this.text,this.index,this.onButtonClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.red)
    ),
           ),
           ),
            onPressed: (){
               onButtonClick(index);
              },
            child: Text(text ,
              style: TextStyle(color: Colors.white, fontSize: 32,
              ),

            )),
    );
  }
}
