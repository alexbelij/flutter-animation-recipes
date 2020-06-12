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
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = Tween(
      begin: -0.1,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
    childAnimation = Tween(
      begin: 20.0,
      end: 125.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: Transform(
                transform: Matrix4.translationValues(
                  animation.value * width,
                  0.0,
                  0.0,
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: childAnimation,
                    builder: (BuildContext context, Widget child) {
                      return Container(
                        padding: EdgeInsets.all(
                          15.0,
                        ),
                        height: childAnimation.value * 2,
                        width: childAnimation.value * 2,
                        child: ListView(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.lightBlue,
                              elevation: 7.0,
                              textColor: Colors.white,
                              child: Text('Login'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
