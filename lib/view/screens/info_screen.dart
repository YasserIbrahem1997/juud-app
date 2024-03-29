import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juud/view/widget/button.dart';
import 'package:juud/view/widget/custom_text.dart';
import 'package:juud/view_model/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'auth/login_screen.dart';

class StartApp extends StatefulWidget {
  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  // Create controller because it's added to PageView
  final _controller = PageController();

  final List<String> _typeStatusOrder = <String>[
    'العربية',
    'EN',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1,
        width: double.infinity,
        child: PageView(
          controller: _controller,
          children: [
            // Page 1
            Column(

              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 70,
                  height: 70,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(

                        children: [
                          Visibility(
                            visible: const Locale("ar", "AR") == true,
                            child: CustomText(
                              text: "العربية",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                          Visibility(
                            visible: selectedValue ==null,
                            child: CustomText(
                              text: "تغير اللغه",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                          Visibility(
                            visible: const Locale("en", "US") == true,
                            child: CustomText(
                              text: "EN",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                        ],
                      ),
                      items: _typeStatusOrder
                          .map(
                              (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: colorTextblack,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) async {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();

                        setState(() {
                          value == "EN"
                              ? context
                              .setLocale(const Locale("en", "US"))
                              : context
                              .setLocale(const Locale("ar", "AR"));
                          selectedValue = value;

                        });
                        await prefs.setString('Locale', value.toString());
                        print(value.toString());
                        print(prefs.toString());
                      },

                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding:
                        const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.transparent,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 14,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness:
                          MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                          MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 60,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 500,
                    child: Image.asset(
                      "assets/images/charachter.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: colorButton,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Pay Less, Enjoy More, & Save Us All".tr(),
                          color: colorText,
                          height: 1.5,
                          fontSize: 36,
                        ),
                        Spacer(),
                        MyButton(
                          height: 50,
                          width: 350,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  LoginScreen()
                                // BottomBar()
                              ),
                            );
                          },
                          lable: "Get Start".tr(), // Fixed typo in label
                          color: colorText,
                          colorTextButton: colorButton,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: 2,
                            effect: const WormEffect(
                              activeDotColor: colorText,
                              dotColor: colorTextblack,
                              dotWidth: 10.0, // Ensure valid numerical values
                              dotHeight: 10.0, // Ensure valid numerical values
                              spacing: 8.0, // Example spacing value, adjust as needed
                              strokeWidth: 2.0, // Example stroke width value, adjust as needed
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Page 2
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 70,
                  height: 70,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(

                        children: [
                          Visibility(
                            visible: const Locale("ar", "AR") == true,
                            child: CustomText(
                              text: "العربية",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                          Visibility(
                            visible: selectedValue ==null,
                            child: CustomText(
                              text: "تغير اللغه",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                          Visibility(
                            visible: const Locale("en", "US") == true,
                            child: CustomText(
                              text: "EN",
                              fontSize: 12,
                              color: colorTextblack,
                            ),
                          ),
                        ],
                      ),
                      items: _typeStatusOrder
                          .map(
                              (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: colorTextblack,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          value == "EN"
                              ? context
                              .setLocale(const Locale("en", "US"))
                              : context
                              .setLocale(const Locale("ar", "AR"));
                          selectedValue = value;
                        });
                        print(value.toString());
                      },

                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding:
                        const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.transparent,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 14,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness:
                          MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                          MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 60,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      "assets/images/hands.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: colorButton,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Enjoy The Taste & Fight The Waste".tr(),
                          color: colorText,
                          height: 1.5,
                          fontSize: 36,
                        ),
                        Spacer(),
                        MyButton(
                          height: 50,
                          width: 350,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  LoginScreen()
                                // BottomBar()
                              ),
                            );
                          },
                          lable: "Get Start".tr(), // Fixed typo in label
                          color: colorText,
                          colorTextButton: colorButton,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count:2,
                            effect: const WormEffect(
                              activeDotColor: colorText,
                              dotColor: colorTextblack,
                              dotWidth: 10.0, // Ensure valid numerical values
                              dotHeight: 10.0, // Ensure valid numerical values
                              spacing: 8.0, // Example spacing value, adjust as needed
                              strokeWidth: 2.0, // Example stroke width value, adjust as needed
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
