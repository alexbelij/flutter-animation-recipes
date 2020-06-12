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
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 800,
      ),
    );
    animation = Tween(
      begin: 0.0,
      end: -0.15,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  width: 350.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Buy'),
                        elevation: 7.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RaisedButton(
                        child: Text('Details'),
                        elevation: 7.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 400.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/I/61EN6MLOfgL._SY450_.jpg',
                        ),
                      ),
                    ),
                    transform: Matrix4.translationValues(
                      0.0,
                      animation.value * height,
                      0.0,
                    ),
                  ),
                  onTap: () {
                    animationController.forward();
                  },
                  onDoubleTap: () {
                    animationController.reverse();
                  },
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
