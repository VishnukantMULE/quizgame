
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/models/quiz_response.dart';
import 'package:quizgame/routes/app_routes.dart';
import 'package:quizgame/screens/quiz/quiz_model.dart';
import 'package:quizgame/services/api_service/api_service.dart';

class QuizController extends GetxController {
  QuizModel model = QuizModel();
  QuizResponseModel responseModel = QuizResponseModel();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    getData();
  }



  void getData() async {
    await ApiService().getQuizData()?.then((data) {
      responseModel = data!;
      model.quetionNumber++;
    });

  }

  bool checkAnswer(String selectedOption)
  {
    model.selectedOption.value=selectedOption;
    if(responseModel.results?[model.quetionNumber.value].correctAnswer==selectedOption)
      {
        model.optionButtonColor.value=Colors.green;

        return true;
      }
    else
      {
        model.optionButtonColor.value=Colors.red;

        return false;
      }
  }

  void nextQuestion() async{

    if (model.quetionNumber.value < responseModel.results!.length-2) {

      model.quetionNumber.value++;
      resetAniation();

    } else {
      // if (model.totalQuestions > 0) {
      //   model.totalCompletion = ((model.solvedQuestions.value / model.totalQuestions) * 100).toInt();
      // } else {
      //   model.totalCompletion = 0;
      // }
      Map<String, dynamic> resultData={
        'totalQuestions':model.totalQuestions,
        'solvedQuestions':model.solvedQuestions.value,
        'correctQuestions':model.correctQuetions.value,
        'incorrectQuestions':model.incorrectQuestions.value,
        'totalCompletion':model.totalCompletion
      };
      Get.offNamed(Routes.resultView,arguments: resultData);


      // model.quetionNumber.value;
      // model.quetionNumber.value;

    }
  }

  void previousQuestion() {
    if (model.quetionNumber.value > 1) {
      model.quetionNumber.value--;

    } else {
      model.quetionNumber.value;

    }
  }
  void resetAniation()
  {
    model.key.value++;
  }
  void onPressedHandler(String option)
  async{
    bool isCorrect =checkAnswer(option);
    await Future.delayed(const Duration(seconds: 1));
    isCorrect? model.correctQuetions++:model.incorrectQuestions++;
    nextQuestion();
    model.solvedQuestions++;

  }
}
