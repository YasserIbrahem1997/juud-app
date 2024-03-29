import 'package:flutter/material.dart';
import 'package:juud/view_model/constant.dart';


class CustomAuthFormField extends StatelessWidget {
  TextEditingController? controller;
  String? title;
  String? hintText;
  double? fontSize;
  Widget? suffixIcon;
  Widget? prefixIcon;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  GestureTapCallback? onTap;
  bool obscureText;
  bool readonly;
  AutovalidateMode? autovalidateMode;

  CustomAuthFormField(
      {Key? key,
        this.controller,
        this.readonly = false,
        this.title,
        this.hintText,
        this.fontSize = 14,
        this.suffixIcon,
        this.prefixIcon,
        this.validator,
        this.type,
        this.onTap,
        this.obscureText = false,
        this.autovalidateMode = AutovalidateMode.onUserInteraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
      cursorColor: Colors.grey,
      autovalidateMode: autovalidateMode,
      maxLines: 1,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      style: TextStyle(
        color: colorTextblack,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        fillColor: colorTextWiht,
        filled: true,
        errorMaxLines: 2,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: title,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        labelStyle:  TextStyle(
            color: colorSubtext,
            fontSize: fontSize,
          ),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.merge(
                BorderSide(width: 0.25, color: colorTxetOrange),
                BorderSide(width: 0.25, color: colorTxetOrange))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.merge(
              BorderSide(width: 0.25, color: Colors.red),
              BorderSide(width: 0.25, color: Colors.red),
            )),
        errorStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}