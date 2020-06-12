import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This trailing comma makes auto-formatting nicer for build methods.
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnim;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    animation = Tween(
      begin: 10.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    transformationAnim = BorderRadiusTween(
      begin: BorderRadius.circular(
        125.0,
      ),
      end: BorderRadius.circular(
        0.0,
      ),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: animation.value,
                  height: animation.value,
                  decoration: BoxDecoration(
                    borderRadius: transformationAnim.value,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
