import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class HomeController extends GetxController

{
  void gotoQuiz(){
    Get.offNamed(Routes.quizView);
  }
}