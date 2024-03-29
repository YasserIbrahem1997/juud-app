

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../view_model/constant.dart';
import '../../../widget/button.dart';
import '../../../widget/custom_text.dart';
import '../../CompleteProfile/CompleteProfile.dart';

class CardVerifyOtp extends StatelessWidget {
  const CardVerifyOtp({
    super.key,
    required this.phoneController,
    required this.nextPage,
    required this.defaultPinTheme, required bool Selected,
  });

  final TextEditingController phoneController;
  final nextPage;
  final defaultPinTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,

      children: [
        Container(
            width: 500,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            child: SingleChildScrollView(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: nextPage,
                        child: Container(

                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: colorBorderCard,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8.5,
                              ),
                              CustomText(
                                text: "تغيير رقم الهاتف",
                                fontSize: 12,
                                color: colorTextblack,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomText(
                        text: "أدخل الرمز التأكيدي",
                        fontSize: 18,
                        color: colorTextblack,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'قم بإدخال الرمز التأكيدي المرسل إلى الهاتف  ',
                          style:  TextStyle(
                              fontSize: 13,
                              color: colorSubtext,
                              fontWeight: FontWeight.w400,
                              height: 1.35,
                            ),

                          children: <TextSpan>[
                            TextSpan(
                              text: '+${phoneController.text}906  ',
                              style:  TextStyle(
                                    fontSize: 15,
                                    color: colorTextblack,
                                    fontWeight: FontWeight.w400,
                                    height: 1.35,
                                    fontFamily: "Alexandria"),

                            ),
                            TextSpan(
                              text: ' عبر رسالة نصية قصيرة ',
                              style: TextStyle(
                                    fontSize: 13,
                                    color: colorSubtext,
                                    fontWeight: FontWeight.w400,
                                    height: 1.35,
                                    fontFamily: "Alexandria"),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(
                                      color: colorTextblack, width: 2))),
                          onCompleted: (pin) => debugPrint(pin),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MyButton(
                        width: 303,
                        height: 48,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            CompleteProfile()
                              // BottomBar()

                            ),
                          );
                        },
                        color: colorTxetOrange,
                        lable: "confirm number",
                        colorTextButton: colorTextWiht,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Countdown(
                      //   seconds: 60,
                      //   build: (BuildContext context, double time) => CustomText(
                      //     text:
                      //     "أعد الإرسال خلال ( ${time.toInt().toString()} ) ثانية",
                      //     fontSize: 13.sp,
                      //     color: zipCodeColorGray,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      //   interval: Duration(milliseconds: 100),
                      //   onFinished: () {
                      //     print('Timer is done!');
                      //   },
                      // ),
                    ],
                  )),
            )),
      ],
    );
  }
}