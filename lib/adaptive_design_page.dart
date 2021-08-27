import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/constants.dart';
import 'package:flutterresponsivedesign/screen_utils.dart';

class AdaptiveDesignPage extends StatefulWidget {
  const AdaptiveDesignPage({Key? key}) : super(key: key);

  @override
  _AdaptiveDesignPageState createState() => _AdaptiveDesignPageState();
}

class _AdaptiveDesignPageState extends State<AdaptiveDesignPage> {
  @override
  Widget build(BuildContext context) {
    bool isHandset = getFormFactor(context) == ScreenType.Handset;
    double _opacity = isHandset ? 0.0 : 1.0;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: VerticalMenu(),
      ),
      backgroundColor: Color(0xffeff2f7),
      body: LayoutBuilder(builder: (context, constraints) {
        _opacity = getFormFactor(context) == ScreenType.Handset ? 0.0 : 1.0;

        return Row(
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceIn,
              child: Visibility(
                visible: _opacity == 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide(color: Colors.black12, width: 1.0)),
                  ),
                  width: 250.0,
                  child: VerticalMenu(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isHandset ? ShortHeader(_scaffoldKey) : WideHeader(),
                  isHandset
                      ? Expanded(
                          child: ShortBody(),
                        )
                      : Expanded(
                          child: WideBody(),
                        ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ShortHeader extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  const ShortHeader(this._scaffoldKey, {Key? key}) : super(key: key);

  @override
  _ShortHeaderState createState() => _ShortHeaderState();
}

class _ShortHeaderState extends State<ShortHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.7,
      leading: Tooltip(
        message: "Menu",
        child: InkWell(
          onTap: () => widget._scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.menu,
            color: Colors.black54,
            size: 30,
          ),
        ),
      ),
      title: Text(
        "FS",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(profileImageUrl))),
        ),
        SizedBox(
          width: 20.0,
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}

class WideHeader extends StatefulWidget {
  const WideHeader({Key? key}) : super(key: key);

  @override
  _WideHeaderState createState() => _WideHeaderState();
}

class _WideHeaderState extends State<WideHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: TextField(
              key: Key("searchSite"),
              autofocus: false,
              cursorColor: Colors.black12,
              maxLines: 1,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Search site",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w800),
                prefixIcon: Tooltip(
                    message: 'Search', child: Icon(Icons.search_outlined)),
                contentPadding: EdgeInsets.only(right: 3.0),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: NetworkImage(profileImageUrl))),
              ),
              Text(
                "Nency",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VerticalMenu extends StatefulWidget {
  const VerticalMenu({Key? key}) : super(key: key);

  @override
  VverticalMenuState createState() => VverticalMenuState();
}

class VverticalMenuState extends State<VerticalMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Fashion\nSpot",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "News",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Shop",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Message",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Notification",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            "Logout",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ShortBody extends StatefulWidget {
  const ShortBody({Key? key}) : super(key: key);

  @override
  _ShortBodyState createState() => _ShortBodyState();
}

class _ShortBodyState extends State<ShortBody> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: newsTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 5.0,
                    color: Color(0xffeff3ff),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: TextField(
                key: Key("searchSite"),
                autofocus: false,
                cursorColor: Colors.black12,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search site",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300),
                  prefixIcon: Tooltip(
                      message: 'Search', child: Icon(Icons.search_outlined)),
                  contentPadding: EdgeInsets.only(right: 3.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Fashion News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: new TabBar(
                controller: _tabController,
                tabs: newsTabs,
                physics: AlwaysScrollableScrollPhysics(),
                isScrollable: true,
                indicatorColor: Colors.black,
                indicatorWeight: 1.0,
                unselectedLabelColor: Colors.black45,
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GridView.builder(
                padding: EdgeInsets.all(0.0),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 400
                        ? MediaQuery.of(context).size.width ~/ 400
                        : 1,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0),
                itemCount: 5,
                scrollDirection: Axis.vertical,
                reverse: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    width: MediaQuery.of(context).size.width > 400
                        ? 400.0
                        : MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: news[index]['color'],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              'assets/model${index + 1}.png',
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    news[index]['text'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black45,
                                              blurRadius: 10.0),
                                        ]),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    CupertinoIcons.play_arrow_solid,
                                    color: Colors.black,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class WideBody extends StatefulWidget {
  const WideBody({Key? key}) : super(key: key);

  @override
  _WideBodyState createState() => _WideBodyState();
}

class _WideBodyState extends State<WideBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScreenType _screenType;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: newsTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (mContext, constraints) {
      _screenType = getFormFactor(mContext);

      return Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top header
              Row(
                children: [
                  // Title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Fashion News",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        // Tabs
                        TabBar(
                          controller: _tabController,
                          tabs: newsTabs,
                          physics: AlwaysScrollableScrollPhysics(),
                          isScrollable: true,
                          indicatorColor: Colors.black,
                          indicatorWeight: 1.0,
                          unselectedLabelColor: Colors.black45,
                          unselectedLabelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Visibility(
                          visible: _screenType == ScreenType.Tablet,
                          child: searchNewsWidget(),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),

                  // Search news
                  Visibility(
                    visible: _screenType != ScreenType.Handset &&
                        _screenType != ScreenType.Tablet,
                    child: searchNewsWidget(),
                  ),
                ],
              ),

              // Blogs
              GridView.builder(
                  padding: EdgeInsets.all(0.0),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 400
                          ? MediaQuery.of(context).size.width ~/ 400
                          : 1,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 20.0),
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  reverse: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: getFormFactor(context) == ScreenType.Handset
                              ? 10.0
                              : 20.0),
                      width: MediaQuery.of(context).size.width > 400
                          ? 400.0
                          : MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: news[index]['color'],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                'assets/model${index + 1}.png',
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      news[index]['text'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black45,
                                                blurRadius: 10.0),
                                          ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }

  Widget searchNewsWidget() {
    return Container(
      width: 200.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      alignment: Alignment.center,
      child: TextField(
        key: Key("searchNews"),
        autofocus: false,
        cursorColor: Colors.black12,
        maxLines: 1,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search News",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
              fontWeight: FontWeight.w300),
          suffixIcon: Tooltip(
              message: 'Search',
              child: Icon(
                CupertinoIcons.search,
                color: Colors.black38,
              )),
          contentPadding: EdgeInsets.only(right: 3.0),
        ),
      ),
    );
  }
}
