import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class CustomAuthFormField extends StatelessWidget {
  TextEditingController? controller;
  String? title;
  String? hintText;
  double? fontSize;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLines;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  GestureTapCallback? onTap;
  bool obscureText;
  bool readonly;
  AutovalidateMode? autovalidateMode;
  bool? isCollapsed;
  List<TextInputFormatter>?inputFormatters;
  CustomAuthFormField({
    Key? key,
    this.controller,
    this.isCollapsed = false,
    this.readonly = false,
    this.title,
    this.hintText,
    this.fontSize = 12,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.validator,
    this.type,
    this.onTap,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      inputFormatters:inputFormatters,
      textAlign: TextAlign.start,
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
      cursorColor: Color(0xff909090),
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10.0,right: 10),
        isCollapsed: isCollapsed,

        fillColor:  Color(0xfff4f4f4),
        filled: true,
        errorMaxLines: maxLines,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: title,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff909090),
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: Color(0xff909090),
          fontSize: fontSize,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.merge(
            const BorderSide(
              color: Colors.red,
              width: 0,
              style: BorderStyle.solid,
            ),
            BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
