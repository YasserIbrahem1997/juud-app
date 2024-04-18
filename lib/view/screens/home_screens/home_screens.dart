import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juud/view/widget/custom_text.dart';
import 'package:juud/view/widget/search_button_widget/CustomSearchTextFormFiled.dart';
import 'package:juud/view_model/constant.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notifications_none_outlined),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            print("homeAddres");
          },
          child: Row(
            children: [
              SvgPicture.asset("assets/svg/location_iocn.svg"),
              CustomText(
                text: "Home",
                fontSize: 13,
                color: colorTextblack,
              ),
              SvgPicture.asset("assets/svg/dropDown_icon.svg"),
            ],
          ),
        ),
        actions: [
          // Drawer(
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       DrawerHeader(
          //         child: Text('Drawer Header'),
          //         decoration: BoxDecoration(
          //           color: Colors.blue,
          //         ),
          //       ),
          //       ListTile(
          //         title: Text('Item 1'),
          //         onTap: () {
          //           // Update the state of the app.
          //           // ...
          //         },
          //       ),
          //       ListTile(
          //         title: Text('Item 2'),
          //         onTap: () {
          //           // Update the state of the app.
          //           // ...
          //         },
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height/1,
        width: MediaQuery.of(context).size.width/1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.025,
                  height: 50,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.black,width: 0.5
                    )
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/search_icon.svg",color: subTitleGray,),
                      CustomText(text: "search", fontSize: 13,color: subTitleGray,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
