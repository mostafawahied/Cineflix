import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/Menu/Zoom_Socfold.dart';
import 'package:cineflix/widget/additional/CardScrollWidget.dart';
import 'package:flutter/material.dart';

import 'package:cineflix/widget/snappable.dart';

final Screen home = new Screen(
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
      image: new AssetImage('assets/nhH3Ve6.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          new ColorFilter.mode(const Color(0xCC000000), BlendMode.darken)),
  contentBuilder: (BuildContext context) {
    return HomePage();
  },
);

List<String> images = [
  "assets/captain-marvel-movie-poster.jpg",
  "assets/Main image.jpg",
  "assets/68721293.jpg",
  "assets/aladdin-movie-review.800x600.jpg",
];

List<String> title = [
  "Captain Marvel",
  "Godzilla: King of the Monsters",
  "John Wick 3",
  "Aladdin",
];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var currentPage = images.length - 1.0;

  buildSlideMovies(PageController controller, String title) {
    return Container(
      /*decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),*/
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 43.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFff6e6e),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text("SEE ALL",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    ZoomScaffoldState homestatevar =
        context.ancestorStateOfType(TypeMatcher<ZoomScaffoldState>());

    return new ListView(children: <Widget>[
      Snappable(
        key: homestatevar.snappableKey,
        snapOnTap: true,
        onSnapped: () => print("Snapped!"),
        child: buildSlideMovies(controller, 'Latest'),
      ),
    ]);
  }
}
