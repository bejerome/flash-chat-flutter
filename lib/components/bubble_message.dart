import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
Color bubbleColor;
TextStyle bubbleTextColor;
CrossAxisAlignment myCrossAlignment;
class MessageBubbles extends StatelessWidget {
  final String sender;
  final String message;
  final bool isMe;
  MessageBubbles({this.sender, this.message, this.isMe});

  @override
  Widget build(BuildContext context) {
     if (isMe){
       bubbleColor = Colors.green[900];
       bubbleTextColor = kbubbleMeTextStyle;
       myCrossAlignment = CrossAxisAlignment.start;
     }else{
       bubbleColor = Colors.blueGrey[700];
       bubbleTextColor = kbubbleTextStyle;
       myCrossAlignment = CrossAxisAlignment.end;
     } 
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:
          Column(crossAxisAlignment: myCrossAlignment, children: <Widget>[
        Text(
          sender,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
        Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          elevation: 5.0,
          color: bubbleColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Text(
              message,
              style: bubbleTextColor,
            ),
          ),
        )
      ]),
    );
  }
}
