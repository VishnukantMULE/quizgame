
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
        model.correctQuetions++;
        return true;
      }
    else
      {
        model.optionButtonColor.value=Colors.red;
        model.incorrectQuestions++;
        return false;
      }
  }

  void nextQuestion() async{

    if (model.quetionNumber.value < responseModel.results!.length-2) {


      model.optionButtonColor.value=Colors.purple;
      // await Future.delayed(const Duration(seconds: 3));

      model.quetionNumber.value++;
      model.sollvedQuestions++;




      // Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizView()))
    } else {
      Get.offNamed(Routes.resultView);
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
    checkAnswer(option);
    resetAniation();
    nextQuestion();
  }


}
