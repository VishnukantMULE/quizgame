import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/screens/home/home_controller.dart';
import 'package:quizgame/widgets/app_primary_button.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController=Get.put(HomeController());
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Image.asset('assets/images/home_undraw.png'),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:  AppPrimaryButton(
                text: "Start Quiz",
                onPressed:homeController.gotoQuiz,
            ),
          ),
        ],
      ),
    );
  }
}
