import 'dart:math' as math;
import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:flutter/material.dart';

class ChartProgressCircle extends StatelessWidget {
  const ChartProgressCircle({
    super.key,
    required this.heading,
    required this.percentageText,
    required this.percentage,
    required this.color,
    required this.bgColor
  });

  final double percentage;
  final Color color;
  final Color bgColor;
  final String percentageText;
  final String heading;


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: MyPainter(percent: 100,color:bgColor ),
                child: Container(),
              )
          ),
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: MyPainter(percent: percentage,color: color),
                child: Container(),
              )
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    percentageText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: CustomColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: CustomColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double percent;
  Color color;

  MyPainter({required this.percent,required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if(percent>=100){
      percent = 110;
    }
    var sweepAngle = (percent * 6) / 100;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const startAngle = -math.pi / 2;

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = 11
      ..blendMode = BlendMode.srcIn;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
