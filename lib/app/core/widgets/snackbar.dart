import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/app/core/design/colors.dart';
import 'package:kora/app/core/design/fonts.dart';

class Snackbar extends StatelessWidget {
  const Snackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SnackBar(
        padding: const EdgeInsets.all(8.0),
          backgroundColor: Colors.white,
          content: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Connection Failed",style: TextStyle(color: AppColors.clearPurple, fontFamily: AppFonts.roboto, fontWeight: FontWeight.w600,fontSize: 16),),
              IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Color.fromRGBO(47, 72, 88, 0.8), size: 20,)),
            ],),

            Text("try again", style:Get.theme.textTheme.subtitle2,),
          ],),
          shape: RoundedRectangleBorder(
            side: BorderSide()
          ),
          
        ),
    );
  }
}