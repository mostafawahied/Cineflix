import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/MovieDetails/seriesApi.dart';
import 'package:cineflix/widget/card/movieCardHome.dart';
import 'package:flutter/material.dart';

import 'TVSeriesDetialsPage.dart';

final Screen tvscreen = new Screen(
  title: new Text(
    'TV Shows',
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
            headImageAssetPath: 'assets/art-0181218713-x300.jpg',
            title: 'Breaking Bad',
            subtitle: 'Crime, Drama, Thriller',
            rate: '9.5',
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TVSeriesDetialsPage(
                            movie: series,
                          )));
            },
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-1246750284-x300.jpg',
            title: 'Game of Thrones',
            subtitle: 'Action, Adventure, Drama',
            rate: '9.4',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-2062705645-x300.jpg',
            title: 'The Walking Dead',
            subtitle: 'Drama, Horror, Thriller',
            rate: '8.3',
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
            headImageAssetPath: 'assets/art-0351520858-x300.jpg',
            title: 'Peaky Blinders ',
            subtitle: 'Crime, Drama',
            rate: '8.8',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-1970661576-x300.jpg',
            title: 'The 100 ',
            subtitle: 'Drama, Mystery, Sci-Fi',
            rate: '7.7',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-1250373553-x300.jpg',
            title: '13 Reasons Why',
            subtitle: 'Drama, Mystery',
            rate: '7.9',
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
            headImageAssetPath: 'assets/art-2651379874-x300.jpg',
            title: 'Chernobyl',
            subtitle: ' Drama, History, Thriller',
            rate: '9.5',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-0181218713-x300.jpg',
            title: 'Breaking Bad',
            subtitle: 'Crime, Drama, Thriller',
            rate: '9.5',
          ),
          new MovieCard(
            headImageAssetPath: 'assets/art-1246750284-x300.jpg',
            title: 'Game of Thrones',
            subtitle: 'Action, Adventure, Drama',
            rate: '9.4',
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
      buildtitle('Populer Tv Shows'),
      buildpopuler(context),
      buildtitle('Latest Tv Shows'),
      buildLatest(context),
      buildtitle('Top Tv Shows'),
      buildTop(context),
    ]);
  }
}
