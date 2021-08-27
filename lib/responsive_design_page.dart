import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/constants.dart';

class ResponsiveDesignPage extends StatefulWidget {
  const ResponsiveDesignPage({Key? key}) : super(key: key);

  @override
  _ResponsiveDesignPageState createState() => _ResponsiveDesignPageState();
}

class _ResponsiveDesignPageState extends State<ResponsiveDesignPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scafolldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: newsTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafolldKey,
      drawer: Drawer(
        child: VerticalMenu(),
      ),
      backgroundColor: Color(0xffeff2f7),
      appBar: MediaQuery.of(context).size.width / 4.5 < 200
          ? AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: () => _scafolldKey.currentState!.openDrawer(),
                child: Icon(
                  CupertinoIcons.text_alignleft,
                  color: Colors.black,
                ),
              ),
              actions: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/model1.png"))),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                )
              ],
            )
          : null,
      body: Row(
        children: [
          // Vertical Menu
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width / 4.5 > 200
                ? MediaQuery.of(context).size.width / 4.5
                : 0,
            height: MediaQuery.of(context).size.height,
            child: VerticalMenu(),
          ),

          // Main body
          Expanded(
            child: Column(
              children: [
                // Header for desktops
                Visibility(
                  visible: MediaQuery.of(context).size.width / 4.5 > 200,
                  child: WideHeader(),
                ),

                // Title, tabs and search for desktops
                Expanded(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              // Title and tabs
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
                                  ],
                                ),
                              ),

                              // Search for desktops
                              Visibility(
                                visible:
                                    MediaQuery.of(context).size.width / 4.5 >
                                        200,
                                child: Container(
                                  width: 200.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white,
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
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
                                      contentPadding:
                                          EdgeInsets.only(right: 3.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20.0,
                          ),

                          // Blogs
                          GridView.builder(
                              padding: EdgeInsets.all(0.0),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              400
                                          ? MediaQuery.of(context).size.width ~/
                                              400
                                          : 1,
                                      childAspectRatio: 1.0,
                                      crossAxisSpacing: 20.0),
                              itemCount: 5,
                              scrollDirection: Axis.vertical,
                              reverse: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Image.asset(
                                            'assets/model${index + 1}.png',
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  news[index]['text'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      shadows: [
                                                        Shadow(
                                                            color:
                                                                Colors.black45,
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
                                                  CupertinoIcons
                                                      .play_arrow_solid,
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                  image: DecorationImage(
                    image: AssetImage("assets/model1.png"),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
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
