import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juud/view/screens/auth/widget/AddPhoneNumber.dart';
import 'package:juud/view/screens/auth/widget/CardVerifyOtp.dart';
import 'package:juud/view/widget/button.dart';
import 'package:juud/view_model/constant.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  bool selected = false;
  void previousPage() {
    if (_pageController.page! < 2) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        selected = !selected;
      });
    }
  }

  void nextPage() {
    if (_pageController.page! < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        selected = !selected;
      });
    }
  }

  final defaultPinTheme = PinTheme(
      width: 55,
      height: 50,
      textStyle: TextStyle(fontSize: 16, color: Colors.black),
      decoration: BoxDecoration(
          color: colorText,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: colorTextblack, width: 0.75)));

  @override



  Widget build(BuildContext context) {


    return Scaffold(
      body: Form(
        key: formstate,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1,
              color: colorButton,
              padding: EdgeInsets.all(13),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "assets/svg/splash.svg",
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/2,
                      ),
                    ),


                    // todo card login and verified
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 500,
                      height: 370,
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            height: selected ? 400 : 320,
                            width: 500,
                            alignment:
                            selected ? Alignment.bottomCenter : AlignmentDirectional.bottomCenter,
                            duration: const Duration(seconds: 1),
                            decoration: BoxDecoration(
                                color: colorTextWiht,
                                borderRadius: BorderRadius.all(Radius.circular(30))),

                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              // Disable page swiping
                              controller: _pageController,
                              children: [
                                CardVerifyOtp(
                                  phoneController: phoneController,
                                  nextPage: nextPage,
                                  defaultPinTheme: defaultPinTheme,
                                  Selected :selected,
                                ),
                                AddPhoneNumber(
                                  phoneController: phoneController,
                                  previousPage: previousPage,
                                  formstate: formstate,
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //   floatingActionButton: FloatingActionButton(
      //   onPressed: nextPage,
      //   tooltip: 'Next',
      //   child: Icon(Icons.arrow_forward),
      // ),
    );
  }
}
