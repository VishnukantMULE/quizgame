
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizgame/models/quiz_response.dart';
import 'package:http/http.dart' as http;

class ApiService{
  
  Future<QuizResponseModel?>? getQuizData() async
  {
    print("api response calll");
    try{
      var res= await http.get(Uri.parse("https://opentdb.com/api.php?amount=10&type=multiple"));
      if(res.statusCode==200)
        {
          print("api response got");
          QuizResponseModel model=QuizResponseModel.fromJson(json.decode(res.body));
          return model;
        }
    }
    catch(e)
    {
      print(e.toString());
    }
    return null;
  }
  
  
  // final dio=Dio();
  // Future<QuizResponseModel?> getQuizData() async{
  //   const url="https://opentdb.com/api.php?amount=10";
  //   print("req started");
  //   try{
  //     final res=await dio.get(url);
  //     if(res.statusCode==200)
  //     {
  //       QuizResponseModel model= QuizResponseModel(
  //       print("data got is ${res.data}");
  //       return model;
  //     }
  //   }
  //    on DioException catch(e)
  //   {
  //     print(e.toString());
  //   }
  //   return null;
  // }


}