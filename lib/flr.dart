import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool isDisabled = true;
  final bool isSelected = false;
  int _counter = 0;
  String _animation = "Idle";
  static const Duration animationDuration = Duration(milliseconds: 175);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = const Color.fromRGBO(84, 114, 239, 1);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            const SizedBox(
              width: 160,
              height: 160,
              child: FlareActor('assets/flare/Chomper.flr',
                  alignment: Alignment.center,
                  shouldClip: false,
                  fit: BoxFit.contain,
                  animation: 'Game Over'),
            ),
            const SizedBox(
              width: 160,
              height: 160,
              child: FlareActor('assets/flare/Coin.flr',
                  alignment: Alignment.center,
                  shouldClip: false,
                  fit: BoxFit.contain,
                  animation: 'Game Over'),
            ),
             SizedBox(
              width: 160,
              height: 160,
              child: FlareActor(
                'assets/flare/TheHacker.flr',
                alignment: Alignment.center,
                shouldClip: false,
                fit: BoxFit.contain,
                animation: _animation,
              ),
            ),
            AnimatedPadding(
              padding: EdgeInsets.only(top: 27, bottom: 50),
              duration: animationDuration,
              curve: Curves.easeInOut,
              child: AnimatedContainer(
                duration: animationDuration,
                width: 130,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.17),
                        offset: const Offset(0, 10),
                        blurRadius: isSelected ? 30 : 10),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: backgroundColor,
                ),
                child: Text('@@@@'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //  执行到AnimButton状态
            _animation = "AnimButton";
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
