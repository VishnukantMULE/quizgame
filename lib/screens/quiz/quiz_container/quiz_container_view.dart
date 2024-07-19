import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/screens/quiz/quiz_controller.dart';
import 'package:quizgame/utils/html_parser.dart';

class QuizContainerView extends StatelessWidget {
  final String question;
  final String option_1;
  final String option_2;
  final String option_3;
  final String option_4;

  const QuizContainerView({
    super.key,
    required this.question,
    required this.option_1,
    required this.option_2,
    required this.option_3,
    required this.option_4,
  });

  @override
  Widget build(BuildContext context) {
    final QuizController quizcontroller = Get.find<QuizController>();

    return ListView(
      children:[


        Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black,width: 3)
        ),
        height: MediaQuery.of(context).size.height * 0.25, // Constrain height of the Stack
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).size.height * 0.18,
              child: IgnorePointer(
                ignoring: true,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  curve: Curves.fastOutSlowIn,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          HtmltoTextParser().htmlDecoder(question),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: ClipOval(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 10),
                      onEnd: quizcontroller.nextQuestion,
                      builder: (context, value, child) {
                        return SizedBox(
                          width: 90,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(
                              value: value,
                              strokeWidth: 7,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 10),
                builder: (context, value, child) {
                  int finalVal = (value * 10).toInt();
                  quizcontroller.model.timeDuration.value = finalVal;
                  return Text(
                    finalVal.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),


      ),
        const SizedBox(height: 180,),

        Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * 0.60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(
                      color: Colors.purpleAccent,
                      width: 3
                  )

              ),
              onPressed: () {
                quizcontroller.nextQuestion();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option_1,style: const TextStyle(
                      fontSize: 25,color: Colors.black
                  ),
                  ),
                  Icon(Icons.circle_outlined)
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * 0.60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(
                      color: Colors.purpleAccent,
                      width: 3
                  )

              ),
              onPressed: () {
                quizcontroller.nextQuestion();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option_2,style: const TextStyle(
                      fontSize: 25,color: Colors.black
                  ),
                  ),
                  Icon(Icons.circle_outlined)
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * 0.60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(
                      color: Colors.purpleAccent,
                      width: 3
                  )

              ),
              onPressed: () {
                quizcontroller.nextQuestion();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option_3,style: const TextStyle(
                      fontSize: 25,color: Colors.black
                  ),
                  ),
                  Icon(Icons.circle_outlined)
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * 0.60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(
                      color: Colors.purpleAccent,
                      width: 3
                  )

              ),
              onPressed: () {
                quizcontroller.nextQuestion();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option_4,style: const TextStyle(
                      fontSize: 25,color: Colors.black
                  ),
                  ),
                  Icon(Icons.circle_outlined)
                ],
              )
          ),
        ),


      ]
    );
  }
}
