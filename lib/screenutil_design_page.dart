import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreeenUtilDesignPage extends StatefulWidget {
  @override
  _ScreeenUtilDesignPageState createState() => _ScreeenUtilDesignPageState();
}

class _ScreeenUtilDesignPageState extends State<ScreeenUtilDesignPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Stack(
          children: [
            _controller.value.isInitialized
                ? Positioned(
                    height: 350.h,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        height: _controller.value.size.height,
                        width: _controller.value.size.width,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Container(),
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 250.h,
                    elevation: 0.0,
                    floating: true,
                    pinned: true,
                    snap: false,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return FlexibleSpaceBar(
                          title: constraints.constrainHeight() <= 150.h
                              ? AppBar(
                                  automaticallyImplyLeading: false,
                                  title: Text(
                                    "John Balton",
                                  ),
                                )
                              : Container(),
                          background: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(),
                          ),
                        );
                      },
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 30.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40.r),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Color(0xfff46b45),
                                    Color(0xffeea849),
                                  ])),
                              child: Icon(
                                CupertinoIcons.pencil,
                                size: 30.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.w,
                          mainAxisSpacing: 4.w,
                        ),
                        itemCount: 30,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Color(0xffccdbfd),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(5.r),
                            alignment: Alignment.center,
                            child: Text("Text ${index + 1}"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
