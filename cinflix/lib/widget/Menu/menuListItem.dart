import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  MenuListItem({this.title, this.isSelected,this.onTap});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      splashColor: const Color(0x44000000),
      onTap: isSelected ? null : onTap,
      child: new Container(
        width: double.infinity,
        child: new Padding(
          padding: EdgeInsets.only(left: 50, top: 15, bottom: 15),
          child: new Text(
            title,
            style: new TextStyle(
              color: isSelected ? Colors.red : Colors.white,
              fontFamily: 'bebas-neue',
              fontSize: 25.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
