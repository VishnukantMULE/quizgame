import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/routes/app_routes.dart';
import 'package:quizgame/widgets/app_text_field.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),(){
      Get.offNamed(Routes.homeView);
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/gifs/quizgame.gif'),
      ),
    );
  }
}
