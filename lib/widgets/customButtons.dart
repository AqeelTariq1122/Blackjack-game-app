import 'package:flutter/material.dart';
import 'package:black_jack/black jack screen.dart';

class CustomButtons extends StatelessWidget {

   final void  Function() onPressed;
  final String label;
  final Color buttonColor;

  const CustomButtons({required this.onPressed, required this.label, required this.buttonColor}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 50,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: 120,
        onPressed: onPressed,
    );
  }
}
// Color(0XFF418281)