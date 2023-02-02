import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie2/components/searchField.dart';
import 'package:movie2/provider/moviesprovider.dart';
import 'package:provider/provider.dart';

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

  Provider.of<MoviesProvider>(context,listen: false).getData(moviecat: 'recommendations');

} );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
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
          SafeArea(child: ListView(
            children:  [
              SizedBox(height: 28,),
              Text('What would you \n like to watch',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.w700,letterSpacing: 1),
              ),
              SearchField(padding: EdgeInsets.all(20)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Recommended',style: TextStyle(color: Colors.grey,fontSize:20,fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20,),
            SizedBox(
              height: 160,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return Container(
child:Text(Provider.of<MoviesProvider>(context).recommended[index].title??'ziad' ),
                );
              }, separatorBuilder: (ctx,index){
                    return Divider(
                      thickness: 1,
                    );
              } ,itemCount: 1),
            )
            ],
          ))
          ],
        ),
      ),
    );
  }
}
