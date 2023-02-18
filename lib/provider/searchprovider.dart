import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';
import '../util/msg.dart';
class Search extends ChangeNotifier{
 List<Movie> q=[];
 String text='';
 bool loading=false;
 searchData({required text})async{
   loading=true;
   try{
     http.Response response=await http.get(Uri.parse(
         'https://api.themoviedb.org/3/search/movie?api_key=1203cfed1e084fc77db7e94eb152ca70&query=$text'));
     List json  = jsonDecode( response.body)['results'] ;
     if(response.statusCode==200){
       json.forEach((element) {
         q.add(
             Movie(
                 poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element['poster_path']}',
                 name:element['title'] ,
                 description: element['overview'],
                 rate: element['vote_average'],
                 cast: [],
                 id: element['id'],

             )
         );
         print (element);
       });
       notifyListeners();
     }else if(response.statusCode==404){
       getFlutterToast('Sorry,No Data', Colors.deepOrange);
     }
     loading=false;
   }catch(e){
     print(e);
   }
 }
}