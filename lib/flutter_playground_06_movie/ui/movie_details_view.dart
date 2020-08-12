// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/model/movie.dart';

// New route (screen or page)
class MovieDetailsView extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieDetailsView({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      // Create user interface here.
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images)
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  MovieDetailsThumbnail(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // Another stack
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Note: Container gives us flexibility to customize UI design.
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                // Note: At least 2 colors are required to create a gradient.
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment
                    .topCenter, // Specify where to start the first color
                end: Alignment
                    .bottomCenter), // Specify where to end the last color.
          ),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          // SizedBox is used to create the space that we have control over
          // its size.
          SizedBox(width: 16.0),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(poster),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // everything starts from the left
      children: <Widget>[
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.cyan,
          ),
        ),
        Text(movie.title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32.0)),
        // Note: Text.rich => for long texts
        Text.rich(TextSpan(
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
          children: <TextSpan>[
            TextSpan(text: movie.plot),
            TextSpan(
              text: " More...",
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        )),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Directors", value: movie.director),
          MovieField(field: "Awards", value: movie.awards),
          MovieField(field: "Language", value: movie.language),
          MovieField(field: "Country", value: movie.country),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field, value;
  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field: ",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
            )),
        Expanded(
            child: Text(value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ))),
      ],
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "More movie posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black26,
            ),
          ),

          // List view with separator between items. Lazy loading.
          // Memory management
          Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // separatorBuilder: create separator
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              // Number of items,
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posters[index]), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Note: Only need a container for horizontal line.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
