import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/models/quiz_response.dart';
import 'package:quizgame/screens/quiz/quiz_model.dart';
import 'package:quizgame/screens/quiz/quiz_view.dart';
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

  void nextQuestion() {
    if (model.quetionNumber.value < 9) {
      model.quetionNumber.value++;
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizView()))
    } else {
      model.quetionNumber.value;

    }
  }

  void previousQuestion() {
    if (model.quetionNumber.value > 1) {
      model.quetionNumber.value--;

    } else {
      model.quetionNumber.value;

    }
  }
}
