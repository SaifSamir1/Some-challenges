import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0009300,size.height*0.5559800);
    path_0.cubicTo(size.width*0.1040300,size.height*0.6967400,size.width*0.1877600,size.height*0.7074200,size.width*0.2765300,size.height*0.7084600);
    path_0.cubicTo(size.width*0.3394000,size.height*0.7043000,size.width*0.5948600,size.height*0.4983200,size.width*0.6754700,size.height*0.5085000);
    path_0.cubicTo(size.width*0.7385300,size.height*0.4997000,size.width*0.9188100,size.height*0.5802000,size.width*0.9983200,size.height*0.6243600);
    path_0.quadraticBezierTo(size.width*1.0022300,size.height*0.6338400,size.width*1.0010000,size.height*0.9940000);
    path_0.lineTo(size.width*0.0010000,size.height*0.9940000);
    path_0.quadraticBezierTo(size.width*-0.0014200,size.height*0.8917000,size.width*0.0009300,size.height*0.5559800);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);


    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 11, 79, 134)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paintStroke0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class CustomPainterExample extends StatelessWidget {
  const CustomPainterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Painter Example"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 400, // العرض
              height: 300, // الطول
              child: CustomPaint(
                painter: RPSCustomPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


