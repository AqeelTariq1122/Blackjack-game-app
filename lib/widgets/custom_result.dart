import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class custom_result_text extends StatelessWidget {
  const custom_result_text({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 25,
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 7.0,
            color: Colors.white,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        // pause: Duration(minutes:20),
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        repeatForever: true,
        isRepeatingAnimation: false,
        animatedTexts: [
          FlickerAnimatedText(
            lable,
            textAlign: TextAlign.center,
          ),
        ],
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}
