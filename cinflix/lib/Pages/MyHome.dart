import 'package:cineflix/Pages/moviePage.dart';
import 'package:cineflix/Pages/watchlistPage.dart';
import 'package:cineflix/widget/Menu/Zoom_Socfold.dart';
import 'package:flutter/material.dart';
import '../Pages/MenuPage.dart';
import '../Pages/TVSeriesPage.dart';
import '../Pages/HomePage.dart';
import 'AnimePage.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: '1',
        title: 'Movies',
      ),
      new MenuItem(
        id: '2',
        title: 'TV Shows',
      ),
      new MenuItem(
        id: '3',
        title: 'Anime',
      ),
      new MenuItem(
        id: '4',
        title: 'WatchList',
      ),
    ],
  );

  static var selectedMenuItemId = '0';
  static var activeScreen = home;

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: new MenuPage(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == '1') {
            setState(() {
              activeScreen = moviescreen;
              ZoomScaffoldState.newindex = null;
            });
          } else if (itemId == '2') {
            setState(() => activeScreen = tvscreen);
          } else if (itemId == '3') {
            setState(() => activeScreen = anime);
          } else if (itemId == '4') {
            setState(() => activeScreen = watchlist);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
