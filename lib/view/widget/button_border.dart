import 'package:flutter/material.dart';

import '../../view_model/constant.dart';

class MyButtonBorder extends StatelessWidget {
  final String lable;
  final double width;
  final double height;
  final Function()? onTap;

  const MyButtonBorder({
    Key? key,
    required this.lable,
    required this.onTap,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Center(
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1.0,
                  color: colorTxetOrange,
                ),
                borderRadius: BorderRadius.circular(10.0))),
          ),
          onPressed: onTap,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              lable,
              style: TextStyle(
                fontSize: 20,
                color: colorTxetOrange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}