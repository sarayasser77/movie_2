import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie2/provider/searchprovider.dart';
import 'package:movie2/screens/secondscreen/second_screen_details/searchDetails/searchDetails.dart';
import 'package:provider/provider.dart';
import '../../../util/searchField.dart';
class Second_ScreenDetails extends StatefulWidget {
  const Second_ScreenDetails({Key? key}) : super(key: key);
  @override
  State<Second_ScreenDetails> createState() => _Second_ScreenDetailsState();
}

class _Second_ScreenDetailsState extends State<Second_ScreenDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHight=MediaQuery.of(context).size.height ;
    final screenWidth=MediaQuery.of(context).size.width ;
    return Consumer<Search>(
      builder: ( context, provider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            body:SizedBox(
              height: screenHight,
              width: screenWidth,
              child: SafeArea(
                child: Stack(
                  children: [
                    SizedBox(height: 20,),
                    Positioned(
                        top: screenHight*.2,
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
                              height: 100,
                              width: 170,
                            ),
                          ),
                        )),
                    Positioned(
                        top: screenHight*.38,
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
                        SearchField(padding: EdgeInsets.all(20)),
                        SizedBox(height: 20,),
                        provider.q.isEmpty==true?
                        Center(
                          child: Image.asset('images/search.png'),
                        ):Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchDetails(
                                          imageDetails: provider.q[index].poster??"",
                                          name: provider.q[index].name??"",
                                          disc: provider.q[index].description??"",
                                          rate: provider.q[index].rate.toInt(),)));
                                      }
                                      ,child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      child:FadeInImage.assetNetwork(placeholder: 'images/placehorder.jpg',
                                        image: provider.q[index].poster??"",

                                        imageErrorBuilder: (c,v,b){
                                          return Image.asset('images/placehorder.jpg');
                                        },
                                      ),

                                    ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth*.01,),
                                  Expanded(child: Text(provider.q[index].description??'',
                                    style: TextStyle(color: Colors.white),maxLines: 4,))
                                ],
                              );
                            },
                            separatorBuilder: (BuildContext context, index) {
                              return const Divider(
                                height: 10,
                                indent: 40,
                                endIndent: 40,
                                thickness: 1.5,
                              );
                            },
                            itemCount:10,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
