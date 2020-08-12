// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/model/movie.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/ui/movie_details_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("assets/film.json");
}

class MovieListView extends StatelessWidget {
  // The data source (not updated using Hot reload)
  List<Movie> listMovies = [];

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikings",
    "Vikings",
  ];

  @override
  Widget build(BuildContext context) {
//    parseJson();

//    listMovies.forEach((element) {
//      debugPrint(element.title);
//    });

//    debugPrint(listMovies.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: FutureBuilder(
        builder: (context, snapshot) {
          var movieList = List.from(json.decode(snapshot.data.toString()));
          movieList.forEach((element) {
            Movie _movie = new Movie.fromJson(element);
            debugPrint(_movie.title);
            listMovies.add(_movie);
          });

          return ListView.builder(
            // set # of items in the list view.
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: <Widget>[
                movieCard(listMovies[index], context),
                Positioned(
                    top: 10.0, child: movieImage(listMovies[index].images[0])),
              ]);
            },
            itemCount: listMovies.length,
          );
        },
        future: DefaultAssetBundle.of(context).loadString("assets/film.json"),
        initialData: [],
      ),
    );
  }

  /// Define movie card as the list tile with customizable design.
  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Row #1: Movie title & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Movie title
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),

                      // imdb Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text("Rating:", style: mainTextStyle()),
                          ),
                          CircularPercentIndicator(
                            radius: 20.0,
                            lineWidth: 2.0,
                            percent: double.tryParse(movie.imdbRating) != null
                                ? double.parse(movie.imdbRating) / 10.0
                                : 0.0,
                            center: double.tryParse(movie.imdbRating) != null
                                ? Text("")
                                : Text("--", style: mainTextStyle(),),
                            progressColor: Colors.yellow,
                            backgroundColor: Colors.blueGrey.shade800,
                          ),
                        ],
                      )
                    ],
                  ),

                  // Row #2: Movie released date, Run time and Rate.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 13.0,
                            ),
                          ),
                          Text("${movie.released}", style: mainTextStyle()),
                        ],
                      ),
                      Text("${movie.runtime} (${movie.rated})",
                          style: mainTextStyle()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        // Navigator
        // Push: when we want to go to certain route.
        Navigator.push(
          context,
          // MaterialPageRoute knows how to build the desired view.
          MaterialPageRoute(
            builder: (context) =>
                MovieDetailsView(movieName: movie.title, movie: movie),
          ),
        );
      },
    );
  }

  /// Define the style for the main text (avoid redundant definition).
  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 13.0,
      color: Colors.grey,
    );
  }

  /// Build container with movie images enclosed in a circular box.
  Widget movieImage(String imageUrl) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          // Add placeholder image if the url does not work.
          image: NetworkImage(imageUrl ??
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Convert JSON string to list of Movie objects.
  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);

    var movieList = List.from(jsonResponse);
    movieList.forEach((element) {
      Movie _movie = new Movie.fromJson(element);

      listMovies.add(_movie);
    });
  }
}
