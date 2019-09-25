import 'package:cineflix/widget/additional/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:cineflix/widget/MovieDetails/ActorScroller.dart';
import 'package:cineflix/widget/MovieDetails/models.dart';
import 'package:cineflix/widget/MovieDetails/MovieDetailHeader.dart';
import 'package:cineflix/widget/MovieDetails/PhotoScroller.dart';
import 'package:cineflix/widget/MovieDetails/Storyline.dart';

class TVSeriesDetialsPage extends StatelessWidget {
  TVSeriesDetialsPage({this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F4F4F4'),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: new FloatingActionButton(
          child: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            PhotoScroller(movie.photoUrls,'Photo',160.0,120.0,100.0),
            SizedBox(height: 20.0),
            ActorScroller(movie.actors),
            SizedBox(height: 20.0),
            PhotoScroller(movie.seasonUrls,'Seasons',160.0,300.0,250.0),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
