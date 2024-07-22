import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizgame/routes/app_routes.dart';
import 'package:quizgame/screens/result/result_controller.dart';
import 'package:quizgame/theme/appcolors.dart';
import 'package:quizgame/widgets/app_primary_button.dart';

class ResultView extends StatelessWidget {
   ResultView({super.key});
  final ResultController resultController=ResultController();

  void navigateRetest()
  {
    Get.offNamed(Routes.quizView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(

                  // border: Border.all(color: Colors.black,width: 3)
                  ),
              height: MediaQuery.of(context).size.height *
                  0.45, // Constrain height of the Stack
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: MediaQuery.of(context).size.height * 0.32,
                    child: IgnorePointer(
                      ignoring: true,
                      child: AnimatedContainer(
                        height: 250,
                        duration: const Duration(seconds: 2),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                              offset: Offset(4, 6), // Shadow position
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        curve: Curves.fastOutSlowIn,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            childAspectRatio: 1.5,
                            primary: false,
                            padding: const EdgeInsets.all(0),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,

                            children: <Widget>[
                              Container(
                                child:const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.circle,color: Colors.purpleAccent,),
                                      SizedBox(width: 10,),
                                      Flexible(child: Text("100%   Completion",style: TextStyle(fontSize: 20,color: Colors.purpleAccent),))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.circle,color: Colors.purpleAccent,),
                                      SizedBox(width: 10,),
                                      Flexible(child: Text("${resultController.quizController.model.totalQuestions} Total Quetions",style: TextStyle(fontSize: 20,color: Colors.purpleAccent),))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child:const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.circle,color: Colors.green,),
                                      SizedBox(width: 10,),
                                      Flexible(child: Text("13 Correct",style: TextStyle(fontSize: 20,color: Colors.green),))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child:const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.circle,color: Colors.red,),
                                      SizedBox(width: 10,),
                                      Flexible(child: Text("07 Wrong",style: TextStyle(fontSize: 20,color: Colors.red),))
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 100,
                    bottom: 150,
                    child: ClipOval(
                      child: AnimatedContainer(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,

                          border: Border.all(color: Appcolors.purplebg2, width: 25),
                        ),
                        duration: const Duration(seconds: 2),
                        child: ClipOval(
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Appcolors.purplebg, width: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 205,
                    child: Column(
                      children: [
                        Text(
                          "Your Score",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.purple),
                        ),
                        Text(
                          "100pt",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold,color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 300,
          ),


          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: AppPrimaryButton(text: "Re-Test", onPressed: navigateRetest),
          // )


        ],
      ),
    );
  }
}
