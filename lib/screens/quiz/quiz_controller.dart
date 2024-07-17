import 'package:get/get.dart';
import 'package:quizgame/screens/quiz/quiz_model.dart';
import 'package:quizgame/services/api_service/api_service.dart';

class QuizController extends GetxController{
  QuizModel model=QuizModel();
  QuizController()
  {}
  void getDate()
  {
     // model.quizData= ApiService().getQuizData();
  }


}