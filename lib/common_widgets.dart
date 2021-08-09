import 'package:flutter/material.dart';

// Header image
Widget headerImage(BoxFit boxFit) {
  return Image.network(
    "https://cdn-images.zety.com/pages/resume_headings.jpg",
    fit: boxFit,
  );
}

// Circular image
Widget circualrImage({
  double height = 100,
  double width = 100,
  double radius = 50,
  String imageUrl = "",
  var boxShadow,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [boxShadow],
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)),
  );
}

// Single row
Widget singleRow(String imageUrl, String title) {
  return Column(
    children: [
      circualrImage(
          height: 50,
          width: 50,
          imageUrl: imageUrl,
          boxShadow: BoxShadow(color: Colors.transparent)),
      SizedBox(
        height: 20,
      ),
      Text(title)
    ],
  );
}
