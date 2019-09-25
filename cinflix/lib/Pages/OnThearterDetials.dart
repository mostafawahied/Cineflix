import 'package:cineflix/widget/additional/HexColor.dart';
import 'package:cineflix/widget/additional/MySliverAppBar.dart';
import 'package:flutter/material.dart';

import 'OnActorDetials.dart';

List<String> imagess = [
  'assets/onceUponTime/1.jpg',
  'assets/onceUponTime/2.jpg',
  'assets/onceUponTime/3.jpg',
  'assets/onceUponTime/4.jpg',
  'assets/onceUponTime/5.jpg',
  'assets/onceUponTime/6.jpg',
  'assets/onceUponTime/7.jpg',
  'assets/onceUponTime/8.jpg',
  'assets/onceUponTime/9.jpg',
  'assets/onceUponTime/10.jpg',
  'assets/onceUponTime/11.jpg',
  'assets/onceUponTime/12.jpg',
  'assets/onceUponTime/13.jpg',
  'assets/onceUponTime/14.jpg',
  'assets/onceUponTime/15.jpg'
];

List<String> names = [
  'Leonardo DiCaprio',
  'Brad Pitt',
  'Margot Robbie',
  'Emile Hirsch',
  'Margaret Qualley',
  'Timothy Olyphant',
  'Julia Butters',
  'Austin Butler',
  'Dakota Fanning',
  'Bruce Dern',
  'Mike Moh',
  'Luke Perry',
  'Damian Lewis',
  'Al Pacino',
  'Nicholas Hammond'
];

class OnTheaterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: HexColor("#1D1D27"),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: MySliverAppBar(
                expandedHeight: 300,
              ),
            ),
            SliverFillRemaining(
                child: new ListView(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  child: new Text(
                    'Storyline',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'AxiformaRegular',
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  child: new Text(
                    'Quentin Tarantino\'s Once Upon a Time... in Hollywood visits 1969 Los Angeles,' +
                        'where everything is changing, as TV star Rick Dalton (Leonardo DiCaprio) and his longtime stunt double Cliff Booth (Brad Pitt) make their way around an industry they hardly recognize anymore. The ninth film from the writer-director features a large ensemble cast and multiple storylines in a tribute to the final moments of Hollywood\'s golden age.',
                    style: new TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontFamily: 'AxiformaRegular',
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 20, top: 20.0),
                  child: new Text(
                    'Cast',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'AxiformaRegular',
                    ),
                  ),
                ),
                new SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: new Row(children: <Widget>[
                    for (int i = 0; i < names.length; i++)
                      new InkWell(
                        onTap: () {
                          if (names[i] == 'Leonardo DiCaprio') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OnActorDetails(),
                                ));
                          }
                        },
                        child: new Column(children: <Widget>[
                          new Container(
                            margin: EdgeInsets.all(10),
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(imagess[i]),
                              ),
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.all(10.0),
                            child: new Text(
                              names[i],
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontFamily: 'AxiformaRegular',
                              ),
                            ),
                          ),
                        ]),
                      ),
                  ]),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
