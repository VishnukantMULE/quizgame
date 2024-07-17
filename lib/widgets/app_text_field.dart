import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final String data;
  final double fonstsize;
  const AppTextField({super.key,required this.data, required this.fonstsize});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(
      fontSize: fonstsize,fontWeight: FontWeight.bold
    ),);
  }
}
