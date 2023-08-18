import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  Color _color = Colors.pink;
  double _height = 200;
  double _width = 200;
  bool _firstChildActive = true;
  double _opacity = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Widget"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: _height,
                width: _width,
                color: _color,
              ),
              ElevatedButton(
                  onPressed: () {
                    _animatedContainerAnimasyon();
                  },
                  child: const Text("Animated Container")),
              AnimatedCrossFade(
                firstChild: Image.network(
                    "https://i.ytimg.com/vi/05vEbwazBs0/hqdefault.jpg"),
                secondChild: Image.network(
                    "https://www.masalcisite.com/wp-content/uploads/bfi_thumb/car-33yvvk97uepc6lc8ru2r62.jpg"),
                crossFadeState: _firstChildActive
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              ElevatedButton(
                onPressed: () {
                  _crossFadeAnimasyonu();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text("Cross Fade Animasyon"),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _opacityAnimasyonu();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text("Opacitiy Görünürlük Animasyon"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContainerAnimasyon() {
    setState(() {
      _color = _color == Colors.pink ? Colors.yellow : Colors.pink;
      _width = _width == 200 ? 300 : 200;
      _height = _height == 200 ? 300 : 200;
    });
  }

  void _crossFadeAnimasyonu() {
    setState(() {
      _firstChildActive = !_firstChildActive;
    });
  }

  void _opacityAnimasyonu() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
    });
  }
}
