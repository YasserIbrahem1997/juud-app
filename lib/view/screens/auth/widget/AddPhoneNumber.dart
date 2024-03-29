
//todo: this class addPhone number
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juud/view_model/constant.dart';

import '../../../widget/CustomButton.dart';
import '../../../widget/custom_text.dart';
import 'CustomAuthFormField.dart';


class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({
    super.key,
    required this.phoneController,
    required this.previousPage,
    required this.formstate, this.Selected,
  });

  final TextEditingController phoneController;
  final previousPage;
  final formstate;
  final Selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 350,
            padding: EdgeInsets.symmetric( horizontal: 23),

            child: SingleChildScrollView(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "مرحباً بك",
                            fontSize: 23,
                            color: colorTextblack,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(width: 3,),
                          // Image.asset("assets/images/waving-hand-sign-emoji-2048x2048-r71rstzv 2.png",width: 35.w),
                        ],
                      ),
                      SizedBox(height: 6),
                      CustomText(
                        text: "سجل دخول بإستخدام جوالك",
                        fontSize: 14,
                        color: colorTextblack,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomAuthFormField(
                              autovalidateMode: AutovalidateMode.disabled, // Disable auto-validation initially
                              prefixIcon: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20
                                ),

                                child: CustomText(
                                  text: "966+",
                                  fontSize: 14,
                                  color: subTitleGray,
                                ),
                              ),
                              controller: phoneController,
                              type: TextInputType.phone,
                              hintText: "رقم الجوال",
                              fontSize: 12,
                              validator: (value) {
                                if (value!.trim().isEmpty || value == ' ' ) {
                                  return 'هذه الحقل مطلوب';
                                }
                                if(value.length <= 8 || value.length >= 10){
                                  return 'يجب الا يقل رقم الهاتف عن 9 ارقام ';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.5,
                      ),
                      CustomButton(
                          width: 303,
                          height: 48,
                          onPressed: () {
                            if (formstate.currentState!.validate()) {
                              previousPage();
                            }else {
                              // Validation failed, show error messages
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('يرجى تصحيح الأخطاء في النموذج'),
                                ),
                              );
                            }
                          },
                          widget: Center(
                            child: CustomText(
                              text: "تأكيد الجوال",
                              fontSize: 14,
                            ),
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: CustomText(
                          text:
                          "ستتلقي رمز تأكيدي عبر هاتفك الجوال عبر رسالة نصية قصيرة خلال أقل من دقيقة",
                          fontSize: 11,
                          color: subTitleGray,
                          fontWeight: FontWeight.w300,
                          height: 1.35,
                        ),
                      )
                    ],
                  )),
            )),
      ],
    );
  }
}