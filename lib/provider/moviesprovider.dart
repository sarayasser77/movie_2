import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:movie2/models/movie.dart';
class MoviesProvider extends ChangeNotifier{
  List<Movie> recommended=[];
  Movie ?  movie;
  List newReleases=[];
  List moreLike=[];
  List details=[];
  List topRated=[];
  getData({required moviecat}) async{
    //https://api.themoviedb.org/3/movie/{movie_id}/images?api_key=<<api_key>>&language=en-US
    try{
      http.Response res =await http.get (Uri.parse('https://api.themoviedb.org/3/movie/{movie_id}/$moviecat?api_key=<<api_key>>&language=en-US&page=1'));
      if(res.statusCode==200){
        if(moviecat=='recommendations'){

          movie = Movie(poster: json.decode(res.body)['results']['release_date'],
              title:  json.decode(res.body)['results']['release_date'],
              img:  json.decode(res.body)['results']['release_date']);

          recommended.add(movie!);
          print(recommended);

        }else if(moviecat=='release_dates'){
          newReleases=json.decode(res.body)['results']['release_date'];
        }else if(moviecat=='similar'){
          moreLike=json.decode(res.body)['results'][''];
        }
        notifyListeners();
      }
    }catch(e){
      print(e);
    }

  }

}