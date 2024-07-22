import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizgame/screens/quiz/quiz_controller.dart';

import '../utils/html_parser.dart';

class OptionButton extends StatefulWidget {
  final String option;
  final QuizController quizController;
  final VoidCallback buttonPressed;
  const OptionButton(
      {super.key, required this.option, required this.quizController,
      required this.buttonPressed});

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * 0.60, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: const BorderSide(color: Colors.purpleAccent, width: 3)),
          onPressed: widget.buttonPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  HtmltoTextParser().htmlDecoder(widget.option),
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
              const Icon(Icons.circle_outlined)
            ],
          )),
    );
  }
}
