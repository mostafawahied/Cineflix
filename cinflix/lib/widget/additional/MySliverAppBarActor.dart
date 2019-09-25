import 'package:flutter/material.dart';

class MySliverAppBarActor extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  MySliverAppBarActor({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    //final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    //final proportion = 2 - (expandedHeight / appBarSize);
    //final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(children: [
        SizedBox(
            height:
                appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize + 50,
            child: new Stack(children: [
              new Positioned(
                left: -220.0,
                child: new Container(
                  child:
                      new Image.asset('assets/LeonardoDiCaprio/download.png'),
                ),
              ),
              AppBar(
                title: appBarSize < kToolbarHeight
                    ? new Row(children: <Widget>[
                        new Column(children: <Widget>[
                          new Text(
                            'Leonardo' + ' ',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'BaskervilleSerial',
                            ),
                          ),
                          new Text(
                            'DiCaprio',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'EncorpadaClassic',
                            ),
                          ),
                        ]),
                        new Container(
                          margin: EdgeInsets.only(left: 70.0),
                          child: new Image.asset(
                              'assets/LeonardoDiCaprio/download.png'),
                        ),
                      ])
                    : new Container(),
                backgroundColor: appBarSize < kToolbarHeight
                    ? Colors.black
                    : Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
                elevation: 0.0,
              ),
            ]))
      ]),
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
