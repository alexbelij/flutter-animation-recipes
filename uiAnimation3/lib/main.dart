import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation flipAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    flipAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animations'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: InkWell(
              onTap: () {
                controller.repeat();
              },
              child: Container(
                height: 200.0,
                width: 200.0,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.005)
                    ..rotateY(pi * flipAnim.value),
                  alignment: Alignment.center,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.green.withOpacity(0.2),
                    child: RotationTransition(
                      turns: flipAnim,
                      child: Center(
                        child: Text(
                          'This flips',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
