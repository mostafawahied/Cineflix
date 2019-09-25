import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/date_picker/DatePickerTimeline.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'OnThearterDetials.dart';

final Screen onTheater = new Screen(
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/Logo/text.png',
        fit: BoxFit.contain,
        height: 150,
        width: 150,
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
      ),
    ],
  ),
  background: new DecorationImage(
      image: new AssetImage('assets/Once-Upon-Time-Hollywood-2019.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          new ColorFilter.mode(const Color(0xCC000000), BlendMode.darken)),
  contentBuilder: (BuildContext context) {
    return OnTheaterPage();
  },
);

class OnTheaterPage extends StatelessWidget {
  buildMovieBookingCard(
      {String image,
      String name,
      String rattigNouber,
      double rate,
      Function() onPressed}) {
    return new InkWell(
      onTap: () {
        onPressed();
      },
      child: new Container(
        child: new Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: new SizedBox(
            width: 220.0,
            height: 420.0,
            child: new Card(
                color: Colors.transparent,
                elevation: 10.0,
                child: new ListView(
                  children: <Widget>[
                    new ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: new Image.asset(
                        image,
                        width: double.infinity,
                        height: 310.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    new Container(
                        padding: EdgeInsets.all(5.0),
                        child: new Text(
                          name,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'AxiformaRegular'),
                        )),
                    new Row(children: <Widget>[
                      SmoothStarRating(
                          allowHalfRating: true,
                          /*onRatingChanged: (v) {
                                rating = v;
                                setState(() {});
                              },*/
                          starCount: 5,
                          rating: rate,
                          size: 15.0,
                          color: Colors.yellowAccent,
                          borderColor: Colors.green,
                          spacing: 0.0),
                      new Text(
                        '     ' + rattigNouber + ' Reviews',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'AxiformaRegular'),
                      )
                    ])
                  ],
                )),
          ),
        ),
      ),
    );
  }

  buildTitle({String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: "mermaid",
                letterSpacing: 1.0,
              )),
        ],
      ),
    );
  }

  buildMovieNext({String image}) {
    return new Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: new SizedBox(
            width: 150.0,
            height: 210.0,
            child: new Card(
              color: Colors.transparent,
              elevation: 10.0,
              child: new Column(children: <Widget>[
                new ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: new Image.asset(
                    image,
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ]),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        buildTitle(name: 'In Theaters'),
        new Padding(
          padding: EdgeInsets.all(0),
          child: DatePickerTimeline(
            DateTime.now(),
            onDateChange: (date) {},
          ),
        ),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: buildTitle(name: 'Next Month'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              buildMovieBookingCard(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                OnTheaterDetails()));
                  },
                  image: 'assets/Once-Upon-Time-Hollywood-2019.jpg',
                  name: 'Once Upon Time In Hollywood',
                  rate: 4.2,
                  rattigNouber: '320k'),
              buildMovieBookingCard(
                  image: 'assets/666666666.jpg',
                  name: 'Angel Has Fallen',
                  rate: 3.3,
                  rattigNouber: '155k'),
              buildMovieBookingCard(
                  image: 'assets/88888888.jpg',
                  name: 'Hobbs & Shaw',
                  rate: 3.5,
                  rattigNouber: '500k'),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(children: <Widget>[
            buildMovieNext(image: 'assets/Once-Upon-Time-Hollywood-2019.jpg'),
            buildMovieNext(image: 'assets/Once-Upon-Time-Hollywood-2019.jpg'),
            buildMovieNext(image: 'assets/Once-Upon-Time-Hollywood-2019.jpg'),
          ]),
        )
      ])
    ]);
  }
}
