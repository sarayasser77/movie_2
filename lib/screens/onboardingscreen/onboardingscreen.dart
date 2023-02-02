import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie2/screens/homepage/homepage.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight*.2,
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
                      sigmaX: 250,sigmaY: 200
                    ),
                    child: Container(
                      height: 170,
                      width: 170,
                    ),
                  ),
                )),
            Positioned(
                top: screenHeight*.38,
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
                        sigmaX: 200,sigmaY: 200
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                    ),
                  ),
                )),
            Column(
              children: [
                SizedBox(height: screenHeight*.05,),
               Stack(
                 children:  [
                   Padding(
                     padding: EdgeInsets.only(top:80),
                     child: Center(
                       child: CircleAvatar(
                         backgroundColor: Colors.blue.shade400,
                         radius: 160,
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 90),
                     child: Center(
                       child: CircleAvatar(
                         radius: 152,
                         backgroundImage: AssetImage('images/watmov.jpg'),
                       ),
                     ),
                   )
                 ],
               ),
                Spacer(),
                Text('Watch movies in \n virtual Reality',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w700,
                  fontSize: screenHeight*.05
                ),
                ),
                const SizedBox(height: 15),
                Text('Download and watch offline \n wherever you are',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight*.02
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 38,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue,width: 5),
                      gradient: LinearGradient(
                          colors: [Colors.white,Colors.blue.shade900],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                          return HomePage();
                        }));
                      },
                      child: Text('Sign up',style: TextStyle(color: Colors.white,fontSize: screenHeight*.03,fontWeight: FontWeight.w700),)),
                ),
                 Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Container(
                    margin: EdgeInsets.all(10),
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index==0?Colors.orange.shade900:index==1?Colors.white30:Colors.white30
                    ),
                  )),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
