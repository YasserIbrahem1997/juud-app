import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juud/view/screens/home_screens/home_screens.dart';
import 'package:juud/view/widget/button.dart';
import 'package:juud/view/widget/custom_text.dart';
import 'package:juud/view_model/constant.dart';

class WelcomingPage extends StatelessWidget {
  const WelcomingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current locale
    Locale currentLocale = context.locale;

    // Check if the current locale is Arabic
    bool isArabic = currentLocale.languageCode == 'ar';
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 14,
            ),
            Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.25,
                child: Image.asset(
                  "assets/images/welcome 1.png", fit: BoxFit.fill,)
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/star.svg",
                ),
                SizedBox(

                  width: 5,),
                CustomText(
                  text: "Let your joy begin".tr(),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorTextblack,
                ),
                SizedBox(
                  width: 5,),
                SvgPicture.asset(
                  "assets/svg/star.svg",
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Visibility(

              visible: isArabic,
              child: CustomText(
                text: "جاهز تروق مودك ؟",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colorTextblack,
              ),),
            Spacer(),
            MyButton(lable: "Start".tr(), onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreens();
              }));
            }),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
