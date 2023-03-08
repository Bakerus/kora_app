import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/colors.dart';
import 'package:kora/app/core/design/fonts.dart';
import 'package:kora/app/core/design/images.dart';
import 'package:kora/app/core/design/text.dart';

import '../controllers/answer_controller.dart';

class AnswerView extends GetView<AnswerController> {
  const AnswerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.57,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(AppImages.validate),
                  Column(
                    children: [
                      Text(Apptext.titleValidation, style: TextStyle(fontSize: 40.0, color: AppColors.greenMaterial,fontFamily: AppFonts.montserrat, fontWeight: FontWeight.w700),),
                      Text(Apptext.validation, textAlign: TextAlign.center, style:Get.theme.textTheme.bodyText1,),
                    ],
                  ),
                ],),
            ),
            InkWell(onTap:(){ }, child: Text("Go to home",style: TextStyle(fontFamily:AppFonts.roboto, fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.greenMaterial),)),
          ],),
      ),
      )
    ;
  }
}
