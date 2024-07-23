
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizModel
{

  List<String?> optionList=[];
  bool isQuizReady=false;
  late List<Map<String,dynamic>> quizData;
  RxInt quetionNumber=0.obs;
  RxInt key = 0.obs;
  var solvedQuestions=0.obs;
  var correctQuetions=0.obs;
  var incorrectQuestions=0.obs;
  var totalQuestions;
  var selectedOption="".obs;
  Rx<Color> optionButtonColor=Colors.purple.obs;
  var delayedSecond=3;
  var totalCompletion=0;

}