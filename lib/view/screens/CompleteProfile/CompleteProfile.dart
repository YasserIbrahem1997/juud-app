import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juud/view/widget/button.dart';
import 'package:juud/view/widget/custom_text.dart';

import '../../../view_model/constant.dart';
import '../../widget/custom_form_field_dash.dart';
import 'AddressPage.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  bool _checkVule = false;

  @override
  Widget build(BuildContext context) {
    // Get the current locale
    Locale currentLocale = context.locale;

    // Check if the current locale is Arabic
    bool isArabic = currentLocale.languageCode == 'ar';
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                ),
                SvgPicture.asset(
                  "assets/svg/Image_preson.svg",
                  width: 130,
                  height: 130,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: "Change profile picture".tr(),
                  fontSize: 18,
                  color: colorButton,
                ),
                SizedBox(
                  height: 40,
                ),
                isArabic? Container(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "* name".tr(),
                    fontSize: 14,
                    color: colorTextblack,
                    fontWeight: FontWeight.bold,
                  ),
                ): Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "* name".tr(),
                    fontSize: 14,
                    color: colorTextblack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: CustomAuthFormField(
                    type: TextInputType.name,
                    hintText: "* name".tr(),
                    // controller: _priceCategoryController,
                    validator: (value) {
                      if (value!.trim().isEmpty || value == ' ') {
                        return 'هذا الحقل مطلوب ';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isArabic? Container(
                  alignment: Alignment.centerRight,

                  child: CustomText(
                    text: "* Email".tr(),
                    fontSize: 14,
                    color: colorTextblack,
                    fontWeight: FontWeight.bold,
                  ),
                ): Container(
                  alignment: Alignment.centerLeft,

                  child: CustomText(
                    text: "* Email".tr(),
                    fontSize: 14,
                    color: colorTextblack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: CustomAuthFormField(
                    type: TextInputType.emailAddress,
                    hintText:"* Email".tr(),
                    // controller: _priceCategoryController,
                    validator: (value) {
                      if (value!.trim().isEmpty || value == ' ') {
                        return 'هذا الحقل مطلوب ';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: allbackgroundcolor),
                      child: Checkbox(
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (!states.contains(MaterialState.selected)) {
                              return allbackgroundcolor;
                            }
                            return null;
                          }),
                          checkColor: colorText,
                          activeColor: colorButton,
                          focusColor: colorTextWiht,
                          side: const BorderSide(
                              color: Colors.transparent, width: 0.001),
                          shape: CircleBorder(

                            side: const BorderSide(
                                color: Colors.transparent, width: 0.001),
                          ),
                          value: _checkVule,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkVule = value!;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                        text: "I agree to JuuuD™".tr(),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: colorSubtext),
                    CustomText(
                        text: "Terms, Conditions and Privacy Policy".tr(),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: colorSubtext),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                MyButton(
                    lable: "Next".tr(),
                    color: colorTxetOrange,
                    colorTextButton: colorTextWiht,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddressPage()
                            // BottomBar()
                            ),
                      );
                    },
                    width: 350,
                    height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
