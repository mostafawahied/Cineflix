import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String headImageAssetPath;
  final String title;
  final String subtitle;
  final String rate;
  final Function() ontap;

  MovieCard(
      {this.headImageAssetPath,
      this.title,
      this.subtitle,
      this.ontap,
      this.rate});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        ontap();
      },
      child: new Stack(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: new SizedBox(
                width: 200.0,
                height: 330.0,
                child: new Card(
                  color: Colors.white,
                  elevation: 10.0,
                  child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        headImageAssetPath,
                        width: double.maxFinite,
                        height: 270.0,
                        fit: BoxFit.fitWidth,
                      ),
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: new Container(
                              padding: const EdgeInsets.all(5.0),
                            ),
                          ),
                          new Expanded(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: new Text(
                                    title,
                                    style: new TextStyle(
                                        fontFamily: 'mermaid',
                                        fontSize: 21.0,
                                        color: Colors.black),
                                  ),
                                ),
                                new Text(subtitle,
                                    style: new TextStyle(
                                        fontFamily: 'bebas-neue',
                                        fontSize: 16.0,
                                        letterSpacing: 1.0,
                                        color: const Color(0xFFAAAAAA))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            right: 10.0,
            top: 0.0,
            child: new Stack(children: <Widget>[
              new Icon(
                Icons.star,
                color: Colors.yellow,
                size: 60.0,
              ),
              new Positioned(
                  right: 16.0,
                  bottom: 20.0,
                  child: new Text(
                    rate,
                    style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'mermaid',
                      fontSize: 20.0,
                    ),
                  )),
            ]),
          ),
          new Positioned(
            left: 0.0,
            top: 0.0,
            child: new RotationTransition(
                turns: new AlwaysStoppedAnimation(-30 / 360),
                child: new SizedBox(
                    width: 90.0,
                    height: 35.0,
                    child: new Card(
                      color: Colors.white,
                      child: new Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0))),
                          child: new Center(
                            child: new Text(
                              'BluRay',
                              style: new TextStyle(
                                  fontFamily: 'mermaid',
                                  fontSize: 20.0,
                                  color: Colors.black),
                            ),
                          )),
                    ))),
          )
        ],
      ),
    );
  }
}
