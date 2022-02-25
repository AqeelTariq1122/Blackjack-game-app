import 'package:flutter/material.dart';

class custom_text extends StatelessWidget {
  const custom_text({Key? key, required this.PlayerScore, required this.label})
      : super(key: key);

  final int PlayerScore;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: new TextSpan(
        text: label,
        style: TextStyle(
            color: Color(0XFFE90003),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'MainFont'),
        children: <TextSpan>[
          new TextSpan(
            text: '$PlayerScore',
            style: new TextStyle(
                color: PlayerScore > 21 ? Color(0XFFE90003) : Colors.black),
          ),
        ],
      ),
    );
  }
}