import 'package:cineflix/widget/additional/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:cineflix/widget/MovieDetails/ActorScroller.dart';
import 'package:cineflix/widget/MovieDetails/models.dart';
import 'package:cineflix/widget/MovieDetails/MovieDetailHeader.dart';
import 'package:cineflix/widget/MovieDetails/PhotoScroller.dart';
import 'package:cineflix/widget/MovieDetails/Storyline.dart';
import 'package:cineflix/chewie.dart';
import 'package:cineflix/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage({this.movie});
  final Movie movie;
  @override
  State<StatefulWidget> createState() {
    return MovieDetailsPageState(movie: movie);
  }
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  final Movie movie;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  MovieDetailsPageState({this.movie});

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.asset('assets/video.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F4F4F4'),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: new FloatingActionButton(
          backgroundColor: Colors.white,
          child: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            PhotoScroller(movie.photoUrls, 'Photo',160.0,120.0,100),
            SizedBox(height: 20.0),
            ActorScroller(movie.actors),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Trailer',
                style: new TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
