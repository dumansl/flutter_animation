import 'package:flutter/material.dart';
import 'package:flutter_animation/page/animation_widget.dart';
import 'package:flutter_animation/page/newpage.dart';
import 'package:flutter_animation/page/transform_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController animationController;
  late Animation animation;
  late Animation animation2;
  late Animation<double> animation3;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController.addListener(() {
      setState(() {
        debugPrint(animationController.value.toString());
        debugPrint(animation.value.toString());
      });
    });

    animation = ColorTween(begin: Colors.red, end: Colors.yellow)
        .animate(animationController);

    animation3 =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animation2 = AlignmentTween(begin: Alignment(-1, -1), end: Alignment(1, 1))
        .animate(animation3);

    // animationController.reverse(from: 100);
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse().orCancel;
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward().orCancel;
      }
      debugPrint(status.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              style: TextStyle(fontSize: animation3.value * 36),
              'You have pushed the button this many times:',
            ),
            Container(
              alignment: animation2.value,
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: animationController.value + 20,
                ),
              ),
            ),
            const Hero(
              tag: "sule",
              child: FlutterLogo(
                size: 64,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const NewPage()),
                    ),
                  );
                },
                child: const Text("Next Page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const AnimationWidget()),
                    ),
                  );
                },
                child: const Text("Animation Widget")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const TransformWidget()),
                    ),
                  );
                },
                child: const Text("Transform Widget")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
