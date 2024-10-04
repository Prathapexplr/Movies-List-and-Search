class MovieListModel {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  MovieListModel({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      title: json['Title'],
      year: json['Year'],
      imdbID: json['imdbID'],
      type: json['Type'],
      poster: json['Poster'],
    );
  }
}
