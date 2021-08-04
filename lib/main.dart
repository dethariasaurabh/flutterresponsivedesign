import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/adaptive_design_page.dart';
import 'package:flutterresponsivedesign/fluid_design_page.dart';
import 'package:flutterresponsivedesign/responsive_design_page.dart';
import 'package:flutterresponsivedesign/static_design_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Designing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => StaticDesignPage())),
              child: Text("Static Design"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => FluidDesignPage())),
              child: Text("Fluid Design"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => ResponsiveDesignPage())),
              child: Text("Responsive Design"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => AdaptiveDesignPage())),
              child: Text("Adaptive Design"),
            ),
          ],
        ),
      ),
    );
  }
}
