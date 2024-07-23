import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/screens/quiz/quiz_controller.dart';
import 'package:quizgame/utils/html_parser.dart';
import 'package:quizgame/widgets/option_button.dart';

import '../../../routes/app_routes.dart';

class QuizContainerView extends StatefulWidget {
  final String question;
  final String option_1;
  final String option_2;
  final String option_3;
  final String option_4;
  final String totalQuestion;


  const QuizContainerView({
    super.key,
    required this.question,
    required this.option_1,
    required this.option_2,
    required this.option_3,
    required this.option_4,
    required this.totalQuestion,
  });

  @override
  State<QuizContainerView> createState() => _QuizContainerViewState();
}

class _QuizContainerViewState extends State<QuizContainerView> {




  @override
  Widget build(BuildContext context) {
    final QuizController quizcontroller = Get.find<QuizController>();

    return ListView(children: [
      Obx((){
        return Container(
          decoration: const BoxDecoration(
            // border: Border.all(color: Colors.black,width: 3)
          ),
          height: MediaQuery.of(context).size.height *
              0.25, // Constrain height of the Stack
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    quizcontroller.model.correctQuetions.value.toString() ,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    CupertinoIcons.checkmark_rectangle_fill,
                                    size: 30,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.xmark_rectangle_fill,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    quizcontroller.model.incorrectQuestions.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Qustions ${quizcontroller.model.quetionNumber}/${widget.totalQuestion}",
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            HtmltoTextParser().htmlDecoder(widget.question),
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
                        key: ValueKey(quizcontroller.model.key.value),
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(seconds: 10),
                        onEnd: () {
                          quizcontroller.nextQuestion();
                          quizcontroller.resetAniation();

                        },
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
                  key: ValueKey(quizcontroller.model.key.value),
                  onEnd: quizcontroller.resetAniation,
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 10),
                  builder: (context, value, child) {
                    int finalVal = (value * 10).toInt();

                    return Text(
                      finalVal.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      const SizedBox(
        height: 220,
      ),
      OptionButton(
        option: widget.option_1,
        quizController: quizcontroller,
        buttonPressed: ()=>quizcontroller.onPressedHandler(widget.option_1),

      ),
      OptionButton(
        option: widget.option_2,
        quizController: quizcontroller,
        buttonPressed: ()=>quizcontroller.onPressedHandler(widget.option_2),

      ),
      OptionButton(
        option: widget.option_3,
        quizController: quizcontroller,
        buttonPressed: ()=>quizcontroller.onPressedHandler(widget.option_3),

      ),
      OptionButton(
        option: widget.option_4,
        quizController: quizcontroller,
        buttonPressed: ()=>quizcontroller.onPressedHandler(widget.option_4),
      ),
    ]);
  }
}
