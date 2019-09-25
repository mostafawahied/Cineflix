import 'package:cineflix/Pages/HomePage.dart';
import 'package:cineflix/Pages/MyHome.dart';
import 'package:cineflix/Pages/ProfilePage.dart';
import 'package:cineflix/Pages/SettingsPage.dart';
import 'package:cineflix/Pages/TracksPage.dart';
import 'package:cineflix/Pages/onTheater.dart';
import 'package:cineflix/widget/BottomAppBar/fab_bottom_app_bar.dart';
import 'package:cineflix/widget/Menu/Screen.dart';
import 'package:cineflix/widget/snappable.dart';
import 'package:flutter/material.dart';
import './MenuConroller.dart';
import 'package:cineflix/presentation/my_flutter_app_icons.dart' as CustomIcons;
import 'package:flutter_svg/flutter_svg.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  State<StatefulWidget> createState() {
    return ZoomScaffoldState();
  }
}

class ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  MenuController menuController;
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  static int newindex;
  final snappableKey = GlobalKey<SnappableState>();

  static String assetName = 'assets/the-infinity-gauntlet-svgrepo-com.svg';
  final Widget svgIcon = new SvgPicture.asset(assetName,
      color: Colors.red, semanticsLabel: 'A red up arrow');

  void _selectedTab(int index) {
    setState(() {
      newindex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  Widget tapbarbutton() {
    return FABBottomAppBar(
      backgroundColor: Colors.transparent,
      centerItemText: 'Home',
      color: Colors.white,
      selectedColor: Colors.pink,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: _selectedTab,
      items: [
        FABBottomAppBarItem(
            iconData: Icons.music_note,
            text: 'Tracks',
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => TrcksPage()));
            }),
        FABBottomAppBarItem(
            iconData: CustomIcons.MyFlutterApp.ticket,
            text: 'Booking',
            onPressed: () {
              setState(() {
                MyHomeState.selectedMenuItemId = '0';
                MyHomeState.activeScreen = onTheater;
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => MyHome()));
              });
            }),
        FABBottomAppBarItem(
            iconData: Icons.person,
            text: 'Profile',
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => ProfilePage()));
            }),
        FABBottomAppBarItem(
            iconData: Icons.settings,
            text: 'Setting',
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => SettingPage()));
            }),
      ],
    );
  }

  Widget floatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          setState(() {
            newindex = null;
            MyHomeState.selectedMenuItemId = '0';
            MyHomeState.activeScreen = home;
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => MyHome()));
          });
        });
      },
      backgroundColor: Colors.white24,
      child: Icon(
        Icons.home,
        size: 35.0,
      ),
      elevation: 2.0,
    );
  }

  createContentDisplay() {
    return zoomAndSlideContent(new Container(
      decoration: new BoxDecoration(
        image: widget.contentScreen.background,
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: tapbarbutton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatActionButton(),
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                menuController.toggle();
              }),
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.contentScreen.title,
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                assetName,
                color: Colors.white,
              ),
              onPressed: () {
                SnappableState state = snappableKey.currentState;
                if (state.isGone) {
                  state.reset();
                } else {
                  state.snap();
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: widget.contentScreen.contentBuilder(context),
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }

    final slideAmountx = 260.0 * slidePercent;
    final slideAmounty = 70.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 10.0 * menuController.percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(
        slideAmountx,
        slideAmounty,
        0.0,
      )..scale(contentScale, contentScale),
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: const Color(0x44000000),
              offset: const Offset(0.0, 0.5),
              blurRadius: 20.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}
