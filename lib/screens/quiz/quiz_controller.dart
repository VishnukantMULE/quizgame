
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

  void checkAnswer(String selectedOption)
  {
    if(responseModel.results?[model.quetionNumber.value].correctAnswer==selectedOption)
      {
        model.correctQuetions++;
      }
    else
      {
        model.incorrectQuestions++;
      }
  }

  void nextQuestion() {
    if (model.quetionNumber.value < responseModel.results!.length-2) {

      model.quetionNumber.value++;
      model.resetKey.value++;
      model.sollvedQuestions++;
      model.timeDuration.value=0;



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

}
