import 'package:flutter/material.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(
      this.photoUrls, this.title, this.width, this.height, this.fromheight);
  final List<String> photoUrls;
  final String title;
  final double width;
  final double height;
  final double fromheight;

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          photo,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            style: new TextStyle(color: Colors.black87, fontSize: 20),
          ),
        ),
        SizedBox.fromSize(
          size:  Size.fromHeight(fromheight),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}
