import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({super.key});

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  double _sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform Widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [getSlider(), getRotate(), getScale(), getTranslate()],
      ),
    );
  }

  getSlider() {
    return Slider(
      value: _sliderValue,
      min: 0,
      max: 100,
      onChanged: (newValue) {
        setState(() {
          _sliderValue = newValue;
        });
      },
    );
  }

  getRotate() {
    return Transform.rotate(
        angle: _sliderValue,
        origin: Offset(_sliderValue, 0),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ));
  }

  getScale() {
    return Transform.scale(
        scale: _sliderValue == 0 ? 1 : _sliderValue / 50,
        child: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
        ));
  }

  getTranslate() {
    return Transform.translate(
        offset: Offset(_sliderValue, _sliderValue),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ));
  }
}
