import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    required this.sender,
    this.isImage = false,
  }) : super(key: key);

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 140,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              sender,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        // Expanded(
        //   child: Text(sender)
        //       .text
        //       .bold
        //       .subtitle1(context)
        //       .make()
        //       .box
        //       .color(sender == "Guest User" ? Vx.red200 : Vx.green200)
        //       .p16
        //       .rounded
        //       .alignCenter
        //       .makeCentered(),
        // ),
        // Expanded(
        //   child: text.trim().text.size(18).bodyText1(context).make().px8(),
        // ),
      ],
    );
  }
}
