import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.x});
  final String x;
  @override
  Widget build(BuildContext context) {
    return Text(x,
      style: TextStyle(
        color: Color(0xff181B47),
        fontFamily: 'Acne',
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
        
        ),
    );
  }
}