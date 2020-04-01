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
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              sender,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
            Material(
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
              elevation: 5.0,
              color: isMe ? Colors.green[900] : Colors.blueGrey[500],
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  message,
                  style: isMe ? kbubbleMeTextStyle : bubbleTextColor,
                ),
              ),
            )
          ]),
    );
  }
}
