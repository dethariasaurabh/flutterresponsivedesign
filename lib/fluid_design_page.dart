import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsivedesign/constants.dart';

class FluidDesignPage extends StatefulWidget {
  @override
  _FluidDesignPageState createState() => _FluidDesignPageState();
}

class _FluidDesignPageState extends State<FluidDesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fluid Design",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(mainContent),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: ()=>{}, child: Text("Button 1")),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(onPressed: ()=>{}, child: Text("Button 2")),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(subContent),
            ],
          ),
        ),
      ),
    );
  }
}
