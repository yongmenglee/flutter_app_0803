// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/model/movie.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/ui/movie_details_view.dart';

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
      backgroundColor: Colors.blueGrey.shade400,
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
//              return Card(
//                color: Colors.white,
//                elevation: 2.0, // shadow
//                child: ListTile(
////              title: Text(movies[index]),
//                  title: Text(listMovies[index].title),
//                  subtitle: Text("Director: ${listMovies[index].director}"),
//                  leading: CircleAvatar(
//                    child: Container(
//                      width: 200,
//                      height: 200,
//                      decoration: BoxDecoration(
//                        // Note: Image in a box decoration is a decoration image.
//                        image: DecorationImage(
//                          image: NetworkImage(listMovies[index].images[0]),
//                          fit: BoxFit.cover,
//                        ),
////                    color: Colors.blue,
//                        borderRadius: BorderRadius.circular(13.9),
//                      ),
////                  child: Text(movies[index][0]),
////                      child: Text(listMovies[index].title[0]),
////                      child: Text("H"),
//                    ),
//                  ),
//                  trailing: Text("..."),
////              onTap: () => debugPrint("Movie name: ${movies[index]}"),
//                  onTap: () {
//                    // Navigator
//                    // Push: when we want to go to certain route.
//                    Navigator.push(
//                      context,
//                      // MaterialPageRoute knows how to build the desired view.
//                      MaterialPageRoute(
//                        builder: (context) =>
////                        MovieDetailsView(movieName: movies[index]),
//                            MovieDetailsView(
//                                movieName: listMovies[index].title,
//                                movie: listMovies[index]),
//                      ),
//                    );
//                  },
//                ),
//              );
            },
            itemCount: listMovies.length,
          );
        },
        future: DefaultAssetBundle.of(context).loadString("assets/film.json"),
        initialData: [],
      ),
//      body: ListView.builder(
//        child: ListView.builder(
//          itemCount: movies.length, // set # of items in the list view.
//          itemBuilder: (BuildContext context, int index) {
//            return Card(
//              color: Colors.white,
//              elevation: 2.0, // shadow
//              child: ListTile(
////              title: Text(movies[index]),
//                title: Text(listMovies[index].title),
//                subtitle: Text("sub"),
//                leading: CircleAvatar(
//                  child: Container(
//                    decoration: BoxDecoration(
////                    color: Colors.blue,
//                      borderRadius: BorderRadius.circular(13.9),
//                    ),
////                  child: Text(movies[index][0]),
////                  child: Text(listMovies[index].title[0]),
//                    child: Text("H"),
//                  ),
//                ),
//                trailing: Text("..."),
////              onTap: () => debugPrint("Movie name: ${movies[index]}"),
//                onTap: () {
//                  // Navigator
//                  // Push: when we want to go to certain route.
//                  Navigator.push(
//                    context,
//                    // MaterialPageRoute knows how to build the desired view.
//                    MaterialPageRoute(
//                      builder: (context) =>
////                        MovieDetailsView(movieName: movies[index]),
//                        MovieDetailsView(movieName: listMovies[index].title),
//                    ),
//                  );
//                },
//              ),
//            );
//          },
//        ),
    );
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),
                      Text("Rating: ${movie.imdbRating} / 10",
                          style: mainTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Released:\n${movie.released}",
                          style: mainTextStyle()),
                      Text("${movie.runtime} (${movie.rated})",
                          style: mainTextStyle()),
//                        Text(movie.rated, style: mainTextStyle()),
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

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 13.0,
      color: Colors.grey,
    );
  }

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

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);

    var movieList = List.from(jsonResponse);
    movieList.forEach((element) {
      Movie _movie = new Movie.fromJson(element);

//        debugPrint(_movie.title);

      listMovies.add(_movie);
    });
  }
}
