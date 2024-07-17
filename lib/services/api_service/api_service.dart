import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService{
  final dio=Dio();
  Future<List<Map<String,dynamic>>?>? getQuizData() async{
    const url="https://opentdb.com/api.php?amount=10";
    try{
      final res=await dio.get(url);
      if(res.statusCode==200)
      {
        return res.data["results"];
      }
    }
     on DioException catch(e)
    {
      print(e.toString());
    }



    return null;
  }


}