import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/card/movieCardHome.dart';
import 'package:flutter/material.dart';

final Screen anime = new Screen(
  title: new Text(
    'Anime',
    style: new TextStyle(
      fontFamily: 'bebas-neue',
      fontSize: 30.0,
    ),
  ),
  background: new DecorationImage(
      image: new AssetImage('assets/EBvMMWSWsAAx3t_.jfif'),
      fit: BoxFit.cover,
      colorFilter:
          new ColorFilter.mode(const Color(0xCC000000), BlendMode.multiply)),
  contentBuilder: (BuildContext context) {
    return TvSeriesPage();
  },
);

class TvSeriesPage extends StatelessWidget {
  buildpopuler(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
        children: <Widget>[
          new MovieCard(
            headImageAssetPath: 'assets/1111.jpg',
            title: 'Death Note',
            subtitle: ' Animation, Crime, Drama',
            rate: '9.0',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/2222.jpg',
            title: 'Attack on Titan',
            subtitle: 'Animation, Action',
            rate: '8.8',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/3333.jpg',
            title: 'Slam Dunk',
            subtitle: ' Animation, Comedy',
            rate: '8.7',
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
            headImageAssetPath: 'assets/4444.jpg',
            title: 'One Punch Man',
            subtitle: 'Animation, Action',
            rate: '8.9',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/5555.jpg',
            title: 'Hunter x Hunter',
            subtitle: 'Animation, Action',
            rate: '8.9',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/6666.jpg',
            title: 'Dragon Ball Z',
            subtitle: ' Animation, Action',
            rate: '8.7',
          ),
        ],
      ),
    );
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
      buildtitle('Populer Anime'),
      buildpopuler(context),
      buildtitle('Latest Anime'),
      buildLatest(context),
    ]);
  }
}
