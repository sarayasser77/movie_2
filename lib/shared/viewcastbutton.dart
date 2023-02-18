import 'package:flutter/material.dart';
import 'package:movie2/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

class ViewCast extends StatelessWidget {
  ViewCast({required this.id});
int id;
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return  Consumer<MoviesProvider>(
      builder: (context,provider,_){return
        Padding(
          padding:  EdgeInsets.only(top: screenHeight*.03,left: screenWidth*.3,right: screenWidth*.3),
          child: ElevatedButton(onPressed: (){
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight:Radius.circular(20)),
                ),
                context: context, builder: (ctx){
              return Container(
                decoration:
                const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight:Radius.circular(20)),
                    color: Colors.black
                ),

                height: screenHeight*.5,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10,right: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: const Text('Similar',style: TextStyle(color: Colors.white,fontSize: 25),),
                      ),
                      Expanded(
                        flex: 4,
                        child: GridView.builder(
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 3
                        ), itemBuilder: (context,index){
                          return Stack(
                            children: [
                              Container(
                                height: 60,
                                 width: 180,
                                 decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(

                                    topRight:   Radius.circular(20),
                                    bottomRight:   Radius.circular(20),
                                    topLeft:   Radius.circular(100),
                                    bottomLeft:   Radius.circular(60),
                                  )
                              ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:   [
                                  Expanded(
                                    flex: 2
                                    ,child: Padding(
                                      padding:  EdgeInsets.only(bottom: screenHeight*.001,left: screenWidth*.01,right: screenWidth*.01),
                                      child: Container(
                                        height: screenHeight*.5,
                                        width: screenWidth*.5
                                        ,decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                      color: Colors.orange
                                        ),
                                        child: FadeInImage.assetNetwork(placeholder: 'images/placehorder.jpg',
                                            image: provider.similar[index].poster??"",fit: BoxFit.cover,
                                          imageErrorBuilder: (c,v,b){
                                            return Image.asset('images/placehorder.jpg');
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  // CircleAvatar(
                                  //   radius: 40,
                                  //   backgroundImage: AssetImage('images/imgpage3.jpg'),
                                  // ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Text('${provider.similar[index].name??""}',style: TextStyle(color: Colors.white),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                          itemCount: provider.similar.length,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            );
          },
            child: const Text('View Similar',style: const TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(primary: Colors.deepOrange,),

          ),
        );
      }


    );
  }
}
