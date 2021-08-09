import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/constants.dart';
import 'common_widgets.dart';

class StaticDesignPage extends StatefulWidget {
  @override
  _StaticDesignPageState createState() => _StaticDesignPageState();
}

class _StaticDesignPageState extends State<StaticDesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Cover
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: headerView(),
                ),

                // Profile
                circualrImage(
                    imageUrl:
                        "https://cdn.dribbble.com/users/1577045/screenshots/4914645/dribble_pic.png?compress=1&resize=800x600",
                    boxShadow: BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 5.0)),
              ],
            ),

            // Space
            SizedBox(
              height: 20,
            ),

            // Body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Interests
                  Text(
                    "Hobbies",
                    style: Theme.of(context).textTheme.headline5,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: hobbies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: singleRow(hobbies.keys.elementAt(index),
                                hobbies.values.elementAt(index)),
                          );
                        }),
                  ),

                  // Description
                  Text(
                    "About me",
                    style: Theme.of(context).textTheme.headline5,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(mainContent),

                  SizedBox(
                    height: 20,
                  ),

                  Text(subContent),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Edit profile",
        child: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
      ),
    );
  }
}

// Header view
Widget headerView() {
  return Container(height: 200.0, child: headerImage(BoxFit.cover));
}
