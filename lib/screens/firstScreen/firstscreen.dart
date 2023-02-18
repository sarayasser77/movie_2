import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie2/shared/custom_list_view.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              //background
              Positioned(
                  top: screenHeight * .2,
                  left: -60,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.shade900
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 250, sigmaY: 200
                      ),
                      child: Container(
                        height: 170,
                        width: 170,
                      ),
                    ),
                  )),
              Positioned(
                  top: screenHeight * .38,
                  right: -90,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade400
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 200, sigmaY: 200
                      ),
                      child: Container(
                        height: 200,
                        width: 200,
                      ),
                    ),
                  )),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  //border
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: screenHeight * .9,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.deepOrange.shade900),
                        borderRadius: BorderRadius.circular(50)
                    ),

                    //body of scree

                    child: const CustomListView(
                      img: "images/watmov.jpg",
                      txt1:  "Watch movies in virtual reality" ,
                      txt2: "Watch wherever you are",
                      txtonthebutton: "Watch now",
                      page: 'first',
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}