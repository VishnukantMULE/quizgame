import 'package:get/get.dart';
import 'package:quizgame/routes/app_routes.dart';
import 'package:quizgame/screens/home/home_view.dart';
import 'package:quizgame/screens/quiz/quiz_view.dart';
import 'package:quizgame/screens/splash/splash_view.dart';

class AppPages{
  static const initial=Routes.splachView;
  static final routes=[
    GetPage(name: Routes.splachView, page: ()=>SplashView()),
    GetPage(name: Routes.homeView, page: ()=>HomeView()),
    GetPage(name: Routes.quizView, page: ()=>QuizView())


  ];



}