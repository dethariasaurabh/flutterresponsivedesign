import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/constants.dart';
import 'common_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveDesignPage extends StatefulWidget {
  @override
  _ResponsiveDesignPageState createState() => _ResponsiveDesignPageState();
}

class _ResponsiveDesignPageState extends State<ResponsiveDesignPage> {
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
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: headerView(),
                ),

                // Profile
                circualrImage(
                    imageUrl:
                        "https://cdn.dribbble.com/users/1577045/screenshots/4914645/dribble_pic.png?compress=1&resize=800x600",
                    height: 100.h,
                    width: 100.w,
                    radius: 50.w,
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Interests
                  Text(
                    "Hobbies",
                    style: Theme.of(context).textTheme.headline5,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Container(
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: hobbies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: singleRow(hobbies.keys.elementAt(index),
                                hobbies.values.elementAt(index),
                                height: 50.h,
                                width: 50.w,
                                radius: 50.w,
                                space: 20.h),
                          );
                        }),
                  ),

                  // Description
                  Text(
                    "About me",
                    style: Theme.of(context).textTheme.headline5,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Text(mainContent),

                  SizedBox(
                    height: 20.h,
                  ),

                  Text(subContent),

                  SizedBox(
                    height: 20.h,
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
  return Container(height: 200.h, child: headerImage(BoxFit.cover));
}
