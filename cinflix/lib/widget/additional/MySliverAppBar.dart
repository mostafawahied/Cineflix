import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'HexColor.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  MySliverAppBar({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
              height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
              child: new Stack(children: [
                new Positioned(
                  width: 420,
                  left: 0.0,
                  child: new Container(
                    child: new Image.asset('assets/various_onceuponatime.jpg'),
                  ),
                ),
                AppBar(
                  backgroundColor: appBarSize < kToolbarHeight
                      ? HexColor("#1D1D27")
                      : Colors.transparent,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                  elevation: 0.0,
                ),
              ])),
          Positioned(
            left: 5.0,
            right: 10.0,
            top: cardTopPosition > 0 ? cardTopPosition + 80 : 0,
            bottom: 10.0,
            child: Opacity(
              opacity: percent,
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Card(
                      color: HexColor("#2a2a3b"),
                      child: new Padding(
                        padding: EdgeInsets.only(left: 200, right: 10.0),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: new Text(
                                'Once Upon a Time in Hollywood',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'AxiformaRegular'),
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 0.0),
                              child: new Row(children: <Widget>[
                                SmoothStarRating(
                                    allowHalfRating: true,
                                    starCount: 5,
                                    rating: 4.05,
                                    size: 15.0,
                                    color: Colors.yellowAccent,
                                    borderColor: Colors.green,
                                    spacing: 0.0),
                                SizedBox(
                                  width: 20.0,
                                ),
                                new Text(
                                  '8.1',
                                  style: new TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 18.0,
                                      fontFamily: 'AxiformaRegular'),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            new Align(
                              alignment: Alignment.centerLeft,
                              child: new Row(children: <Widget>[
                                new Text(
                                  'Rinning Time:' + ' ',
                                  style: new TextStyle(
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                                new Text(
                                  '2h 41min',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            new Align(
                              alignment: Alignment.centerLeft,
                              child: new Row(children: <Widget>[
                                new Text(
                                  'Director:' + ' ',
                                  style: new TextStyle(
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                                new Text(
                                  'Quentin Tarantino',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            new Align(
                              alignment: Alignment.centerLeft,
                              child: new Row(children: <Widget>[
                                new Text(
                                  'Writer:' + ' ',
                                  style: new TextStyle(
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                                new Text(
                                  'Quentin Tarantino',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontFamily: 'AxiformaRegular',
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            left: -100.0,
            right: 100.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 116.8, vertical: 20),
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Card(
                    child:
                        Image.asset('assets/Once-Upon-Time-Hollywood-2019.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
