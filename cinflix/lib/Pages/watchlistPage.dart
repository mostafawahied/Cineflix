import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:flutter/material.dart';

final Screen watchlist = new Screen(
  title: new Text(
    'WatchList',
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
    return WatchlistPage();
  },
);

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.7,
        crossAxisCount: 2,
        children: List.generate(choices.length, (index) {
          return Center(
            child: ChoiceCard(choice: choices[index]),
          );
        }));
  }
}

class Choice {
  const Choice({this.title, this.image});

  final String title;
  final String image;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', image: 'assets/1538309100001.jpg'),
  const Choice(title: 'Bicycle', image: 'assets/Aquaman_poster.jpg'),

];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(10),
      child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Image.asset(
                    choice.image,
                    width: double.maxFinite,
                    height: 270.0,
                    fit: BoxFit.fitWidth,
                  )),
                ]),
          )),
    );
  }
}
