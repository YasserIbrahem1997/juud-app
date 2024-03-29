import 'package:flutter/material.dart';
import 'package:juud/view_model/constant.dart';
class CustomButton extends StatelessWidget {
  Color buttonColor;
  VoidCallback? onPressed;

  CustomButton(
      {this.buttonColor = colorTxetOrange,
        this.onPressed,
        required this.width,
        required this.height,
        this.borderRadius = 10,
        required this.widget});

  double borderRadius;
  double width;
  double height;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          width: width,
          height: height,
          child: widget,
        ));
  }
}