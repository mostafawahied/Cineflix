import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/MovieDetails/movieApi.dart';
import 'package:flutter/material.dart';
import 'package:cineflix/widget/card/movieCardHome.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'MovieDetailsPage.dart';

final Screen moviescreen = new Screen(
  title: new Text(
    'Movies',
    style: new TextStyle(
      fontFamily: 'bebas-neue',
      fontSize: 30.0,
    ),
  ),
  background: new DecorationImage(
      image: new AssetImage('assets/1504266508-justice-league-1.jpeg'),
      fit: BoxFit.cover,
      colorFilter:
          new ColorFilter.mode(const Color(0xCC000000), BlendMode.multiply)),
  contentBuilder: (BuildContext context) {
    return MoviePage();
  },
);

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviePageState();
  }
}

class MoviePageState extends State<MoviePage> {
  buildPopuler(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
        children: <Widget>[
          new Slidable(
            direction: Axis.vertical,
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.15,
            secondaryActions: <Widget>[
              IconSlideAction(
                color: Colors.transparent,
                iconWidget: Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(20),
                    child: new SizedBox(
                      height: 60,
                      width: 200,
                      child: new Container(
                        color: Colors.red,
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.video_library,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              new Text('Add to watchlist')
                            ]),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  _modalBottomSheetMenu();
                },
              ),
            ],
            child: new MovieCard(
              headImageAssetPath: 'assets/1538309100001.jpg',
              title: 'The Secret Life ',
              subtitle: ' Animation, Adventure',
              rate: '6.5',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MovieDetailsPage(
                              movie: testMovie,
                            )));
              },
            ),
          ),
          new MovieCard(
            headImageAssetPath: 'assets/fid18233.jpg',
            title: 'Robin Hood',
            subtitle: ' Drama, Music, Romance',
            rate: '7.0',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/268x0w.jpg',
            title: 'Robin Hood',
            subtitle: ' Drama, Music, Romance',
            rate: '8.0',
          ),
        ],
      ),
    );
  }

  buildLatest(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
        children: <Widget>[
          new MovieCard(
            headImageAssetPath: 'assets/art-2617857905-x300.jpg',
            title: 'Far from Home',
            subtitle: 'Action, Adventure, Sci-Fi',
            rate: '7.9',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-2689687052-x300.jpg',
            title: 'It Chapter Two',
            subtitle: 'Drama, Fantasy, Horror',
            rate: '7.1',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-2617863573-x300.jpg',
            title: 'Dark Phoenix',
            subtitle: 'Action, Adventure, Sci-Fi',
            rate: '5.9',
          ),
        ],
      ),
    );
  }

  buildTop(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
        children: <Widget>[
          new MovieCard(
            headImageAssetPath: 'assets/art-2617832399-x300.jpg',
            title: 'Endgame',
            subtitle: 'Action, Adventure, Sci-Fi',
            rate: '8.6',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-0059933432-x300.jpg',
            title: 'Inception',
            subtitle: 'Action, Adventure, Sci-Fi',
            rate: '8.8',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-1454866491-x300.jpg',
            title: 'Interstellar',
            subtitle: 'Adventure, Drama, Sci-Fi',
            rate: '8.6',
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 50.0,
            width: 20,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: new Center(
                  child: new Text(
                    "Added to your watchlist",
                    style: new TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                )),
          );
        });
  }

  buildtitle(String text) {
    return new Container(
      margin: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 5.0),
      child: SizedBox(
        height: 40.0,
        child: new Text(
          text,
          style: new TextStyle(
              color: Colors.white, fontSize: 35.0, fontFamily: 'bebas-neue'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      buildtitle('Populer Movie'),
      buildPopuler(context),
      buildtitle('Latest Movie'),
      buildLatest(context),
      buildtitle('Top Movie'),
      buildTop(context),
    ]);
  }
}
