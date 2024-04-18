

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juud/view_model/constant.dart';

class CustomSearchTextFormFiled extends StatelessWidget {
  TextEditingController? controller;
  String? title;
  String? hintText;
  double? fontSize;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color hintStyleColor;
  Color fillColorStyle;
  Color outlineInputBorderColor;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  GestureTapCallback? onTap;
  bool obscureText;
  bool readonly;
  AutovalidateMode? autovalidateMode;
  int? maxLines;

  CustomSearchTextFormFiled(
      {Key? key,
        this.controller,
        this.readonly = false,
        this.title,
        this.hintText,
        this.fontSize = 14,
        this.suffixIcon,
        this.prefixIcon,
        required this.fillColorStyle,
        required this.hintStyleColor,
        required this.outlineInputBorderColor,
        this.validator,
        this.type,
        this.onTap,
        this.obscureText = false,
        this.autovalidateMode = AutovalidateMode.onUserInteraction,
        this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
      cursorColor: subTitleGray,
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      style: const TextStyle(
        color: colorTextblack,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        fillColor: fillColorStyle,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: title,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.alexandria(
          textStyle: TextStyle(
            color: subTitleGray,
            fontSize: fontSize,
          ),
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.merge(
              BorderSide.merge(
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor),
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor)),
              BorderSide.merge(
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor),
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor)),
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.merge(
              BorderSide.merge(
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor),
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor)),
              BorderSide.merge(
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor),
                  BorderSide(width: 0.25.w, color: outlineInputBorderColor)),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.merge(
              const BorderSide(width: 0.25, color: colorRed),
              const BorderSide(width: 0.25, color: colorRed),
            )),
        errorStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
      ),
    );
  }
}
