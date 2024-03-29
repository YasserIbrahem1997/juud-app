import 'package:flutter/material.dart';

import '../../view_model/constant.dart';

class MyButton extends StatelessWidget {
  final String lable;
  Color? color;
  Color? colorTextButton;
  final double? width ;
  final double? height;
  final Function()? onTap;

   MyButton({
    Key? key,
    required this.lable,
     this.color = colorTxetOrange,
     this.colorTextButton = colorTextWiht,
    required this.onTap,
     this.width  = 400,
     this.height  = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(

          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Text(
            lable,
            style: TextStyle(
              fontSize: 20,
              color: colorTextButton,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
    );
  }
}
