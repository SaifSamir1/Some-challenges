

import 'package:flutter/material.dart';

class AnimatedContainerShape extends StatelessWidget {
  const AnimatedContainerShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: const Center(
        child: AnimatedContainerShapeWidget(),
      ),
    );
  }
}

class AnimatedContainerShapeWidget extends StatefulWidget {
  const AnimatedContainerShapeWidget({super.key});

  @override
  State<AnimatedContainerShapeWidget> createState() => _AnimatedContainerShapeWidgetState();
}
class _AnimatedContainerShapeWidgetState extends State<AnimatedContainerShapeWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
          selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
