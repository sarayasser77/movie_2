import 'package:flutter/material.dart';
class Third_ScreenDetails extends StatelessWidget {

  List Browse=['Action'
    ,'Comedy'
    ,'Adventure'
    ,'Crime'
    ,'Documentary'
    ,'Drama'
    ,'War'
    ,'Romance'
    ,'Mystery'
    ,'Horror'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Browse Category',style: TextStyle(color:Color(0xFFFFFFFF).withOpacity(.8)),),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ), itemBuilder: (ctx,index){
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color:Colors.black ,
              borderRadius: BorderRadius.circular(20),border: Border.all(color: Color(0xFFf26419).withOpacity(.4))),
          height: 100,
          width: 100,
          child: Text('${Browse[index]}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color:Color(0xFFf26419).withOpacity(.6))
          ),
        );

      },
        itemCount: Browse.length,
      ),
    );
  }
}