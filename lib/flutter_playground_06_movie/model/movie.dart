//class Movie {
////  static Movie getMovies => List<Movie>() [
////    Movie(title, year, rated, released, runtime, genre, director, writer, actor, plot, language, country, awards, poster, metascore, imdbRating, imdbVotes, imdbID, type, response, images)
////  ];
//
//  String title;
//  String year;
//  String rated;
//  String released;
//  String runtime;
//  String genre;
//  String director;
//  String writer;
//  String actor;
//  String plot;
//  String language;
//  String country;
//  String awards;
//  String poster;
//  String metascore;
//  String imdbRating;
//  String imdbVotes;
//  String imdbID;
//  String type;
//  String response;
//  List<String> images;
//
//  Movie(
//      this.title,
//      this.year,
//      this.rated,
//      this.released,
//      this.runtime,
//      this.genre,
//      this.director,
//      this.writer,
//      this.actor,
//      this.plot,
//      this.language,
//      this.country,
//      this.awards,
//      this.poster,
//      this.metascore,
//      this.imdbRating,
//      this.imdbVotes,
//      this.imdbID,
//      this.type,
//      this.response,
//      this.images);
//
////  Movie.fromJson(Map json)
////      : title = json['title'],
////        year = json['year'];
//
//  Movie.fromJson(Map json)
//      : title = json['title'],
//        year = json['year'],
//        rated = json['rated'],
//        released = json['released'],
//        runtime = json['runtime'],
//        genre = json['genre'],
//        director = json['director'],
//        writer = json['writer'],
//        actor = json['actor'],
//        plot = json['plot'],
//        language = json['language'],
//        country = json['country'],
//        awards = json['awards'],
//        poster = json['poster'],
//        metascore = json['metascore'],
//        imdbRating = json['imdbRating'],
//        imdbVotes = json['imdbVotes'],
//        imdbID = json['imdbID'],
//        type = json['type'],
//        response = json['response'],
//        images = json['images'];
//}
//
////Future<String> _loadFromAsset() async {
////  return await rootBundle.loadString("assets/film.json");
////}

// From this link: https://javiercbk.github.io/json_to_dart/

class Movie {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String response;
  List<String> images;

  Movie(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.response,
      this.images});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];
    metascore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    type = json['Type'];
    response = json['Response'];
    images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Rated'] = this.rated;
    data['Released'] = this.released;
    data['Runtime'] = this.runtime;
    data['Genre'] = this.genre;
    data['Director'] = this.director;
    data['Writer'] = this.writer;
    data['Actors'] = this.actors;
    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['Country'] = this.country;
    data['Awards'] = this.awards;
    data['Poster'] = this.poster;
    data['Metascore'] = this.metascore;
    data['imdbRating'] = this.imdbRating;
    data['imdbVotes'] = this.imdbVotes;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Response'] = this.response;
    data['Images'] = this.images;
    return data;
  }
}
