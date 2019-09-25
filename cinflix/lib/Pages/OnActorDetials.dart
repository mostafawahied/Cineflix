//import 'package:cinflix/widget/additional/HexColor.dart';
import 'package:cineflix/widget/additional/HexColor.dart';
import 'package:cineflix/widget/additional/MySliverAppBarActor.dart';
import 'package:flutter/material.dart';

class OnActorDetails extends StatelessWidget {
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
              delegate: MySliverAppBarActor(
                expandedHeight: 400,
              ),
            ),
            SliverFillRemaining(child: new Container()),
          ],
        ),
      ),
    );
  }
}
