import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:quizgame/screens/quiz/quiz_controller.dart';
import 'package:quizgame/utils/html_parser.dart';

class QuizContainerView extends StatelessWidget {
  final String question;
  final String option_1;
  final String option_2;
  final String option_3;
  final String option_4;
  const QuizContainerView(
      {super.key,
      required this.question,
      required this.option_1,
      required this.option_2,
      required this.option_3,
      required this.option_4});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                HtmltoTextParser().htmlDecoder(question),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.80, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  controller.nextQuestion();
                },
                child: Text(option_1)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.80, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  controller.nextQuestion();
                },
                child: Text(option_2)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.80, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  controller.nextQuestion();
                },
                child: Text(option_3)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.80, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  controller.nextQuestion();
                },
                child: Text(option_4))
          ],
        )
      ],
    );
  }
}
