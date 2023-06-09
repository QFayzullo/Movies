import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_list/models/movies.dart';
import 'package:movies_list/widgets/widgets_movies.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List<Movie> _movies= <Movie>[];
  @override
  void initState(){
    super.initState();
    _populateAllMovies();
  }
  void _populateAllMovies() async{
final movies=await _fetchAllMovies();
setState(() {
  _movies=movies;
});
  }

Future<List<Movie>> _fetchAllMovies() async {
 final res =await http.get(Uri.parse("http://nizomiddin96.pythonanywhere.com/api/v1/movie/"));
 if(res.statusCode>0){
 final result= jsonDecode(res.body);
 Iterable list = result["Movies"];
 return list.map((movie) => Movie.fromJson(movie)).toList();
 }
 else{
   throw Exception("Failed...");
 }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body:MoviesWidgets(movies: _movies),
      ),
    );
  }
}
