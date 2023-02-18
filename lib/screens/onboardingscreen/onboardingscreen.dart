import 'package:flutter/material.dart';
import 'package:movie2/shared/listscreens/screens.dart';
import '../../util/indecator.dart';
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
          onPageChanged: (index){
            selectedIndex=index;
        setState(() {
    
  });
},
            itemCount: screensList.length,
              itemBuilder: (context,index) {
                return screensList[index];
              }
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index)=>Indecator(isActive:selectedIndex==index?true:false),


          )
    ),
        SizedBox(height: 10,)
      ],
    );
  }
}

