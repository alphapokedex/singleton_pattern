import 'package:flutter/material.dart';

class GoogleIconCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * 0.9600000, size.height), paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9416000, size.height * 0.5108958);
    path_1.cubicTo(
        size.width * 0.9416000,
        size.height * 0.4769167,
        size.width * 0.9386720,
        size.height * 0.4442458,
        size.width * 0.9332360,
        size.height * 0.4128825);
    path_1.lineTo(size.width * 0.5000000, size.height * 0.4128825);
    path_1.lineTo(size.width * 0.5000000, size.height * 0.5982333);
    path_1.lineTo(size.width * 0.7475640, size.height * 0.5982333);
    path_1.cubicTo(
        size.width * 0.7369000,
        size.height * 0.6581292,
        size.width * 0.7044920,
        size.height * 0.7088750,
        size.width * 0.6557720,
        size.height * 0.7428542);
    path_1.lineTo(size.width * 0.6557720, size.height * 0.8630833);
    path_1.lineTo(size.width * 0.8044360, size.height * 0.8630833);
    path_1.cubicTo(
        size.width * 0.8914200,
        size.height * 0.7796625,
        size.width * 0.9416000,
        size.height * 0.6568208,
        size.width * 0.9416000,
        size.height * 0.5108958);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff4285F4).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.9791708);
    path_2.cubicTo(
        size.width * 0.6242000,
        size.height * 0.9791708,
        size.width * 0.7283240,
        size.height * 0.9362625,
        size.width * 0.8044360,
        size.height * 0.8630792);
    path_2.lineTo(size.width * 0.6557720, size.height * 0.7428542);
    path_2.cubicTo(
        size.width * 0.6145800,
        size.height * 0.7716042,
        size.width * 0.5618880,
        size.height * 0.7885917,
        size.width * 0.5000000,
        size.height * 0.7885917);
    path_2.cubicTo(
        size.width * 0.3801896,
        size.height * 0.7885917,
        size.width * 0.2787804,
        size.height * 0.7043000,
        size.width * 0.2426076,
        size.height * 0.5910458);
    path_2.lineTo(size.width * 0.08892560, size.height * 0.5910458);
    path_2.lineTo(size.width * 0.08892560, size.height * 0.7151917);
    path_2.cubicTo(
        size.width * 0.1646168,
        size.height * 0.8717917,
        size.width * 0.3201804,
        size.height * 0.9791708,
        size.width * 0.5000000,
        size.height * 0.9791708);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff34A853).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.2426092, size.height * 0.5910417);
    path_3.cubicTo(
        size.width * 0.2334092,
        size.height * 0.5622917,
        size.width * 0.2281820,
        size.height * 0.5315792,
        size.width * 0.2281820,
        size.height * 0.5000000);
    path_3.cubicTo(
        size.width * 0.2281820,
        size.height * 0.4684167,
        size.width * 0.2334092,
        size.height * 0.4377083,
        size.width * 0.2426092,
        size.height * 0.4089579);
    path_3.lineTo(size.width * 0.2426092, size.height * 0.2848104);
    path_3.lineTo(size.width * 0.08892720, size.height * 0.2848104);
    path_3.cubicTo(
        size.width * 0.05777280,
        size.height * 0.3494979,
        size.width * 0.04000000,
        size.height * 0.4226792,
        size.width * 0.04000000,
        size.height * 0.5000000);
    path_3.cubicTo(
        size.width * 0.04000000,
        size.height * 0.5773208,
        size.width * 0.05777280,
        size.height * 0.6505000,
        size.width * 0.08892720,
        size.height * 0.7151875);
    path_3.lineTo(size.width * 0.2426092, size.height * 0.5910417);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffFBBC05).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.5000000, size.height * 0.2114108);
    path_4.cubicTo(
        size.width * 0.5675360,
        size.height * 0.2114108,
        size.width * 0.6281720,
        size.height * 0.2355871,
        size.width * 0.6758440,
        size.height * 0.2830683);
    path_4.lineTo(size.width * 0.8077800, size.height * 0.1456346);
    path_4.cubicTo(
        size.width * 0.7281160,
        size.height * 0.06831458,
        size.width * 0.6239880,
        size.height * 0.02083333,
        size.width * 0.5000000,
        size.height * 0.02083333);
    path_4.cubicTo(
        size.width * 0.3201804,
        size.height * 0.02083333,
        size.width * 0.1646168,
        size.height * 0.1282104,
        size.width * 0.08892560,
        size.height * 0.2848104);
    path_4.lineTo(size.width * 0.2426076, size.height * 0.4089583);
    path_4.cubicTo(
        size.width * 0.2787804,
        size.height * 0.2957008,
        size.width * 0.3801896,
        size.height * 0.2114108,
        size.width * 0.5000000,
        size.height * 0.2114108);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffEA4335).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
