import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_model/constant.dart';
import 'custom_text.dart';

class AppBarWidget extends StatelessWidget implements
    PreferredSizeWidget{
  final VoidCallback? onTap;
   String TextTitle;
  AppBarWidget({
    super.key,
     this.onTap,
     required this.TextTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: CustomText(
        text: TextTitle,
        fontSize:24,
        color: colorTextblack,
      ),
      leading:  Icon(null),
      centerTitle: true,
      actions: [
        GestureDetector(


          onTap: (){Navigator.pop(context);},
          child: Container(
            padding:  const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: colorTxetOrange
            ),
            child: Icon(
              Icons.navigate_next_outlined,color: colorTextWiht,
              size: 18,
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
      ],
    ) ;
  }

  @override
  // TODO: implement preferredSize
  @override
  Size get preferredSize => Size(15, 80);
}
