import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizModel
{
  bool isQuizReady=false;
  late List<Map<String,dynamic>> quizData;
  RxInt quetionNumber=0.obs;
  RxDouble durationValue=0.0.obs;
  RxInt timeDuration=0.obs;
  RxInt beginValue=0.obs;
  RxInt endValue=1.obs;
  var resetKey=0.obs;
  RxInt key = 0.obs;

  var sollvedQuestions=0.obs;
  var correctQuetions=0.obs;
  var incorrectQuestions=0.obs;
  var totalQuestions;
  var selectedOption="".obs;

  Rx<Color> optionButtonColor=Colors.purple.obs;

}