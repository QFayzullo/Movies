import 'package:flutter/material.dart';
import '../models/movies.dart';
class MoviesWidgets extends StatelessWidget {
  const MoviesWidgets({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context,id) {
      final movie=movies[id];

      return ListTile(
        title: Text(movie.title),
      );
    }
    );
  }
}
