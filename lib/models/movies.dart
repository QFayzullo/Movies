class Movie{
  final int id;
  final String title;
  final String tagLine;
  final String category;
  final bool rating_user;
  final String middle_star;
  final String poster;

  Movie( {required this.id,
   required this.title,
    required this.tagLine,
    required this.category,
    required this.rating_user,
    required this.middle_star,
    required this.poster});
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        id: json["Id"],
        title: json["Title"],
        tagLine: json["TagLine"],
        category: json["Category"],
        rating_user: json["Rating_user"],
        middle_star: json["Middle_star"],
        poster: json["poster"]
    );
  }
}