import 'package:flutter/material.dart';
import 'package:movie2/shared/viewcastbutton.dart';
import 'package:provider/provider.dart';

import '../../provider/moviesprovider.dart';
class MovieDetails extends StatefulWidget {
  final String imageDetails;
  final String name;
  final int rate;
  final String disc;
  const MovieDetails({Key? key, required this.imageDetails, required this.name, required this.rate, required this.disc}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero ,( ) async{
      Provider.of<MoviesProvider>(context,listen: false).getSimilar(12);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Consumer<MoviesProvider>(
      builder: (context,provider,_){
        return Scaffold(
          body: Container(
              height: screenHeight,
              width: screenWidth,
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.black87
                  ],

                ),
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    SafeArea(
                      child: Container(
                          height:screenHeight*.4,
                          width: screenWidth,
                          child:FadeInImage.assetNetwork(placeholder: 'images/placehorder.jpg', image: widget.imageDetails,fit: BoxFit.fill,)

                      ),
                    ),
                     SizedBox(height: screenHeight*.01,),
                     Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 25),),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Discription:',style: TextStyle(color: Colors.deepOrange,fontSize: 25),),
                         Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(widget.disc,
                              style: TextStyle(color: Colors.white,fontSize: 25)),
                    ),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('Rate: ',style: TextStyle(color: Colors.deepOrange,fontSize: 25),),
                         Text('${widget.rate}',style: TextStyle(color: Colors.white,fontSize: 25,),),
                       ],
                     ),
                    SizedBox(height: screenHeight*.05,),
                    SizedBox(height: screenHeight*.05,),
                    const Divider(thickness: 1,endIndent: 10,indent: 10,color:Colors.deepOrange,),
                    ViewCast(id: 12,)

                  ],
                ),
              )
          ),
        );
      },

    );
  }
}
