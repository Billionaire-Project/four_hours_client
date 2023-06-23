import 'package:flutter/material.dart';

class SavedCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 12);
    path_0.lineTo(7.5, 7.66987);
    path_0.lineTo(7.5, 16.3301);
    path_0.lineTo(0, 12);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF85226).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffF85226).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(
                size.width * 0.1166667, 0, size.width * 0.8833333, size.height),
            bottomRight: Radius.circular(size.width * 0.06666667),
            bottomLeft: Radius.circular(size.width * 0.06666667),
            topLeft: Radius.circular(size.width * 0.06666667),
            topRight: Radius.circular(size.width * 0.06666667)),
        paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(15.368, 16.196);
    path_2.cubicTo(13.114, 16.196, 11.56, 14.936, 11.56, 12.836);
    path_2.lineTo(13.702, 12.836);
    path_2.cubicTo(13.702, 13.774, 14.486, 14.236, 15.354, 14.236);
    path_2.cubicTo(16.152, 14.236, 16.936, 13.816, 16.936, 13.088);
    path_2.cubicTo(16.936, 12.318, 16.04, 12.108, 14.976, 11.87);
    path_2.cubicTo(13.492, 11.506, 11.7, 11.072, 11.7, 8.958);
    path_2.cubicTo(11.7, 7.082, 13.086, 6.018, 15.256, 6.018);
    path_2.cubicTo(17.51, 6.018, 18.784, 7.222, 18.784, 9.182);
    path_2.lineTo(16.698, 9.182);
    path_2.cubicTo(16.698, 8.328, 15.998, 7.936, 15.2, 7.936);
    path_2.cubicTo(14.514, 7.936, 13.828, 8.23, 13.828, 8.874);
    path_2.cubicTo(13.828, 9.56, 14.668, 9.77, 15.718, 10.022);
    path_2.cubicTo(17.202, 10.4, 19.078, 10.862, 19.078, 13.06);
    path_2.cubicTo(19.078, 15.174, 17.398, 16.196, 15.368, 16.196);
    path_2.close();
    path_2.moveTo(26.808, 8.44);
    path_2.lineTo(28.334, 8.44);
    path_2.lineTo(28.334, 16);
    path_2.lineTo(26.738, 16);
    path_2.lineTo(26.556, 15.314);
    path_2.cubicTo(25.912, 15.888, 25.072, 16.224, 24.106, 16.224);
    path_2.cubicTo(21.838, 16.224, 20.144, 14.502, 20.144, 12.22);
    path_2.cubicTo(20.144, 9.938, 21.838, 8.23, 24.106, 8.23);
    path_2.cubicTo(25.086, 8.23, 25.94, 8.58, 26.598, 9.154);
    path_2.lineTo(26.808, 8.44);
    path_2.close();
    path_2.moveTo(24.274, 14.292);
    path_2.cubicTo(25.464, 14.292, 26.332, 13.41, 26.332, 12.22);
    path_2.cubicTo(26.332, 11.03, 25.464, 10.148, 24.274, 10.148);
    path_2.cubicTo(23.084, 10.148, 22.216, 11.03, 22.216, 12.22);
    path_2.cubicTo(22.216, 13.396, 23.084, 14.292, 24.274, 14.292);
    path_2.close();
    path_2.moveTo(35.27, 8.44);
    path_2.lineTo(37.384, 8.44);
    path_2.lineTo(34.388, 16);
    path_2.lineTo(32.498, 16);
    path_2.lineTo(29.418, 8.44);
    path_2.lineTo(31.602, 8.44);
    path_2.lineTo(33.45, 13.508);
    path_2.lineTo(35.27, 8.44);
    path_2.close();
    path_2.moveTo(45.5523, 12.206);
    path_2.cubicTo(45.5523, 12.402, 45.5383, 12.598, 45.5103, 12.794);
    path_2.lineTo(39.7843, 12.794);
    path_2.cubicTo(39.9663, 13.83, 40.6383, 14.404, 41.6323, 14.404);
    path_2.cubicTo(42.3463, 14.404, 42.9343, 14.068, 43.2423, 13.522);
    path_2.lineTo(45.3843, 13.522);
    path_2.cubicTo(44.8383, 15.174, 43.3963, 16.224, 41.6323, 16.224);
    path_2.cubicTo(39.4063, 16.224, 37.7123, 14.488, 37.7123, 12.22);
    path_2.cubicTo(37.7123, 9.952, 39.3923, 8.23, 41.6323, 8.23);
    path_2.cubicTo(43.9563, 8.23, 45.5523, 10.022, 45.5523, 12.206);
    path_2.close();
    path_2.moveTo(41.6323, 9.98);
    path_2.cubicTo(40.7223, 9.98, 40.0783, 10.512, 39.8403, 11.408);
    path_2.lineTo(43.5083, 11.408);
    path_2.cubicTo(43.2143, 10.484, 42.5563, 9.98, 41.6323, 9.98);
    path_2.close();
    path_2.moveTo(52.5513, 5.724);
    path_2.lineTo(54.5953, 5.724);
    path_2.lineTo(54.5953, 16.014);
    path_2.lineTo(53.0833, 16.014);
    path_2.lineTo(52.8453, 15.384);
    path_2.cubicTo(52.2153, 15.916, 51.4033, 16.238, 50.4793, 16.238);
    path_2.cubicTo(48.1833, 16.238, 46.5033, 14.516, 46.5033, 12.234);
    path_2.cubicTo(46.5033, 9.938, 48.1833, 8.23, 50.4793, 8.23);
    path_2.cubicTo(51.2633, 8.23, 51.9633, 8.454, 52.5513, 8.86);
    path_2.lineTo(52.5513, 5.724);
    path_2.close();
    path_2.moveTo(50.6473, 14.306);
    path_2.cubicTo(51.8373, 14.306, 52.7053, 13.41, 52.7053, 12.234);
    path_2.cubicTo(52.7053, 11.044, 51.8373, 10.162, 50.6473, 10.162);
    path_2.cubicTo(49.4573, 10.162, 48.5893, 11.044, 48.5893, 12.234);
    path_2.cubicTo(48.5893, 13.41, 49.4573, 14.306, 50.6473, 14.306);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
