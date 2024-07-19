import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/screens/quiz/quiz_container/quiz_container_view.dart';
import 'package:quizgame/screens/quiz/quiz_controller.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());

    return Scaffold(
      body: Obx(() {
        if (controller.model.quetionNumber.value == 0) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          int index = controller.model.quetionNumber.value;

          var question = controller.responseModel.results?[index].question.toString();
          var opt_1 = controller.responseModel.results?[index].correctAnswer.toString();
          var opt_2 = controller.responseModel.results?[index].incorrectAnswers?[0].toString();
          var opt_3 = controller.responseModel.results?[index].incorrectAnswers?[1].toString();
          var opt_4 = controller.responseModel.results?[index].incorrectAnswers?[2].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizContainerView(
              question: question!,
              option_1: opt_1!,
              option_2: opt_2!,
              option_3: opt_3!,
              option_4: opt_4!,
            ),
          );
        }
      }),
    );
  }
}
