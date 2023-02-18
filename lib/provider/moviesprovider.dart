import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:movie2/models/movie.dart';
import 'package:movie2/util/msg.dart';
class MoviesProvider extends ChangeNotifier{
 bool loading=false;
  List<Movie> recommended=[];
  Movie ?  movie;
  List<Movie> newReleases=[];
  List<Movie> moreLike=[];
  List<Movie> details=[];
  List<Movie> topRated=[];
  List<Movie> castname=[];
  List<Movie> castimage=[];
  List<Movie> similar=[];

  getRecommended(int movieId) async{
    loading=true;
    try{
     http.Response response = await http.get(Uri.parse(
       'https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=1203cfed1e084fc77db7e94eb152ca70'
     )
     );
     List json  = jsonDecode( response.body)['results'] ;

      if(response.statusCode==200){
         json.forEach((element) {
           recommended.add(
             Movie(
                 poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element['poster_path']}',
               name:element['title'] ,
               description: element['overview'],
               rate: element['vote_average'],
                 cast: [], id: element['id']

             )
           );
           print (element);
         });
         notifyListeners();
      }else if(response.statusCode==404){
        getFlutterToast('Sorry,No Data', Colors.deepOrange);
      }
loading=false;
    }
    on SocketException{
      getFlutterToast('Network error', Colors.deepOrange);
    }

    catch(e){
      print(e.toString());
      getFlutterToast('Error', Colors.deepOrange);
    }

  }
  getNewReleases() async{
    try{
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=1203cfed1e084fc77db7e94eb152ca70'
      ));
      List json  = jsonDecode( response.body)['results'] ;

      if(response.statusCode==200){
        json.forEach((element) {
          newReleases.add(
              Movie(
                  poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element['poster_path']}',
                  name:element['title'] ,
                  description: element['overview'],
                  rate: element['vote_average'],
                  cast: [],
                  id: element['id']));
          print (element);
        }
        );
        notifyListeners();
      }
      else if(response.statusCode==404){
        getFlutterToast('Sorry,No Data', Colors.deepOrange);
      }
      loading=false;
    }
    on SocketException{
      getFlutterToast('Network error', Colors.deepOrange);
    }catch(e){
      print(e.toString());
      getFlutterToast('Error', Colors.deepOrange);
    }

  }
 getSimilar(int movieId) async{
   loading=true;
   try{
     http.Response response = await http.get(Uri.parse(
         'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=1203cfed1e084fc77db7e94eb152ca70'
     )
     );
     List json  = jsonDecode( response.body)['results'] ;

     if(response.statusCode==200){
       json.forEach((element) {
         similar.add(
             Movie(
                 poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${element['poster_path']}',
                 name:element['title'] ,
                 description: element['overview'],
                 rate: element['vote_average'],
                 cast: [],
                 id:element['id']

             )
         );
         print (element);
       });
       notifyListeners();
     }else if(response.statusCode==404){
       getFlutterToast('Sorry,No Data', Colors.black);
     }
     loading=false;
   }
   on SocketException{
     getFlutterToast('Network error', Colors.deepOrange);
   }
   catch(e){
     print(e.toString());
     getFlutterToast('Error', Colors.deepOrange);
   }

 }

}