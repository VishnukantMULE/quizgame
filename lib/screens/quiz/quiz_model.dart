import 'package:get/get.dart';

class QuizModel
{
  bool isQuizReady=false;
  late List<Map<String,dynamic>> quizData;
  RxInt quetionNumber=0.obs;
}