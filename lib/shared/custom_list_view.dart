import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/moviesprovider.dart';
class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, required this.txt1, required this.txt2, required this.txtonthebutton, required this.img, required this.page,}) : super(key: key);
  final String txt1   ;
  final  String txt2 ;
  final  String txtonthebutton ;
  final   String img;
  final String page;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * .05,),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 38),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade900,
                        Colors.deepOrange.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                ),
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 160,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47),
              child: Center(
                child: CircleAvatar(
                  radius: 152,
                  backgroundImage: AssetImage(
                      img),
                ),
              ),
            )
          ],
        ),
        Spacer(),
        Text(txt1,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: screenHeight * .05
          ),
        ),
        const SizedBox(height: 15),
        Text(txt2,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: screenHeight * .02
          ),
        ),
        SizedBox(height: 10,),
        //Buttom watch
        Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 47,
                width: 167,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.shade900,
                        Colors.blue.shade900
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 4),
                child: Container(
                  alignment: Alignment.center,
                  height: 38,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepOrange.shade100,
                            Colors.blue.shade100
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Provider.of<MoviesProvider>(context,listen: false).getRecommended(12);

                        Navigator.pushNamed(context, '$page');

                      },
                      child: Text(txtonthebutton,
                        style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: screenHeight * .03,
                            fontWeight: FontWeight.w900),)),
                ),
              ),
            ]

        ),
        Spacer(),

      ],
    );
  }
}
