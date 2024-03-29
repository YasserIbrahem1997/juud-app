import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juud/view/widget/button.dart';
import 'package:juud/view/widget/custom_text.dart';
import 'package:juud/view_model/constant.dart';

import '../../widget/AppBar.dart';
import '../../widget/custom_form_field_dash.dart';
import 'WelcomingPage.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        TextTitle: 'Address'.tr(),
      ),
      body: SingleChildScrollView(
        primary: true,
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.asset(
                      "assets/images/selctLocation.png",
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 27,
                ),
                Container(
                  child: CustomText(
                    text: "House Address*".tr(),
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
                    hintText: "House Address*".tr(),
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
                  height: 16,
                ),
                Container(
                  child: CustomText(
                    text: "City*".tr(),
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
                    hintText: "City*".tr(),
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
                  height: 16,
                ),
                Container(
                  child: CustomText(
                    text: "Street Number/Unit *".tr(),
                    fontSize: 14,
                    color: colorTextblack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: CustomAuthFormField(
                        type: TextInputType.number,

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
                      width: 10,
                    ),
                    SizedBox(
                      width: 70,
                      child: CustomAuthFormField(
                        type: TextInputType.number,

                        // controller: _priceCategoryController,
                        validator: (value) {
                          if (value!.trim().isEmpty || value == ' ') {
                            return 'هذا الحقل مطلوب ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: CustomText(
                    text: "Landmark".tr(),
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
                    type: TextInputType.streetAddress,
                    maxLines: 5,
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
                  height: 16,
                ),
                MyButton(
                    lable: "Continue".tr(),
                    color: colorTxetOrange,
                    colorTextButton: colorTextWiht,
                    onTap: (){
                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                        return WelcomingPage();
                      }));
                    },
                   ), SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
