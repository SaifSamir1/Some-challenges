import 'package:flutter/material.dart';


class BolaWidget extends StatefulWidget {
  const BolaWidget({super.key});

  @override
  State<BolaWidget> createState() => _BolaWidgetState();
}

class _BolaWidgetState extends State<BolaWidget> {
  final GlobalKey _centerKey = GlobalKey();
  double centerWidgetHeight = 0;
  final double fixedWidgetHeight = 45;

  final List<Widget> topWidgets = [];
  final List<Widget> bottomWidgets = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateCenterWidgetHeight();
    });
  }

  void _calculateCenterWidgetHeight() {
    final RenderBox renderBox =
    _centerKey.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      centerWidgetHeight = renderBox.size.height;
    });
    debugPrint("Center Widget Height: $centerWidgetHeight");
  }

  void _addNewWidget() {
    double screenHeight = MediaQuery.of(context).size.height;
    double availableTopSpace = (screenHeight - centerWidgetHeight) / 2;
    if ((topWidgets.length + 1) * fixedWidgetHeight <= availableTopSpace - fixedWidgetHeight) {
      setState(() {
        topWidgets.add(_buildNewWidget());
      });
    } else {
      setState(() {
        bottomWidgets.add(_buildNewWidget());
      });
    }
  }

  Widget _buildNewWidget() {
    return Container(
      height: fixedWidgetHeight,
      color: Colors.blue,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: const Center(
        child: Text(
          'New Widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double centerTop = (screenHeight - centerWidgetHeight) / 2;
    double centerBottom = centerTop + centerWidgetHeight;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewWidget,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: topWidgets,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: centerTop,
            child: Container(
              key: _centerKey,
              height: 100, // ارتفاع ال center widget
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Center Widget',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: centerBottom,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: bottomWidgets,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
