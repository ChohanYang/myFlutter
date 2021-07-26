import 'package:flutter/material.dart';

class LoginBackground extends CustomPaint{

  LoginBackground({required this.isJoin});

  final bool isJoin;
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()..color = isJoin?Colors.red:Colors.blue;
    canvas.drawCircle(Offset(0,0), size.height*0.5, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}