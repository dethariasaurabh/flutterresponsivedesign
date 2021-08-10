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
Widget singleRow(String imageUrl, String title,
    {double height = 50,
    double width = 50,
    double radius = 50,
    double space = 20}) {
  return Column(
    children: [
      circualrImage(
          height: height,
          width: width,
          radius: radius,
          imageUrl: imageUrl,
          boxShadow: BoxShadow(color: Colors.transparent)),
      SizedBox(
        height: space,
      ),
      Text(title)
    ],
  );
}
