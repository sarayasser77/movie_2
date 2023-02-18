import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie2/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

import '../../movie_details/movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero ,( ) async{
      Provider.of<MoviesProvider>(context,listen: false).getRecommended(12);
      Provider.of<MoviesProvider>(context,listen: false).getNewReleases();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Consumer<MoviesProvider>(
      builder: (context,provider,_){
        return Scaffold(
          backgroundColor: Colors.black,
          body:provider.recommended.isEmpty==true?
            Center(
              child: CircularProgressIndicator(color: Colors.orange,),
            ):  SizedBox(
            height: screenHeight,
            width: screenWidth,
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
                          height: 100,
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
                SafeArea(child:
                ListView(
                  children:  [
                    SizedBox(height: 28,),
                    const Text('What would you \n like to watch',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.w700,letterSpacing: 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20,top: 5),
                      child: Text('Recommended',style: TextStyle(color: Colors.grey,fontSize:20,fontWeight: FontWeight.w700),),
                    ),
                    const SizedBox(height: 20,),
                    //Recommended and new releases
                    SizedBox(
                      height: screenHeight,
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                          Expanded(
                            flex:1
                            ,child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                        return MovieDetails(
                                          imageDetails: provider.recommended[index].poster??"",
                                          rate:  provider.recommended[index].rate.toInt(),
                                          name: provider.recommended[index].name??"",
                                          disc:  provider.recommended[index].description??"",
                                        );
                                      }));
                                    },
                                    child:  Container(
                                      margin: EdgeInsets.all(7),
                                      child:FadeInImage.assetNetwork(
                                          placeholder: "images/placehorder.jpg",
                                          image:  provider.recommended[index].poster??"",
                                        imageErrorBuilder: (c,v,b){
                                          return Image.asset('images/placehorder.jpg');
                                        },
                                      ),
                                    )
                                );
                              }, separatorBuilder: (ctx,index){
                            return const Divider(
                              thickness: 2,
                            );
                          } ,itemCount: provider.recommended.length),
                          ),
                          const  SizedBox(height: 20,),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('New Releases',style: TextStyle(color: Colors.grey,fontSize:20,fontWeight: FontWeight.w700),),
                          ),
                          const SizedBox(height: 20,),
                          Expanded(
                            flex: 1,
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                          return MovieDetails(
                                            imageDetails: provider.newReleases[index].poster??"",
                                            name: provider.newReleases[index].name??"",
                                            rate: provider.newReleases[index].rate.toInt(),
                                            disc:provider.newReleases[index].description??"",
                                          );
                                        }));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(7),
                                        child:FadeInImage.assetNetwork(
                                            placeholder: "images/placehorder.jpg",
                                            image:  provider.newReleases[index].poster??"",
                                          imageErrorBuilder: (c,v,b){
                                            return Image.asset('images/placehorder.jpg');
                                          },
                                        ),
                                      )
                                  );
                                }, separatorBuilder: (ctx,index){
                              return const Divider(
                                thickness: 2,
                              );
                            } ,itemCount: provider.newReleases.length),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ],
            ),
          ),
        );
      }


    );
  }
}
