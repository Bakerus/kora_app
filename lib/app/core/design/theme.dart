

import 'package:flutter/material.dart';
import 'package:kora/app/core/design/colors.dart';

class AppTheme {

  static final ligthTheme = ThemeData(
    
    fontFamily: "Raleway",
    // primarySwatch: 

    iconTheme: IconThemeData(
      color: AppColors.greenMaterial[500],
      size: 15,
    ),

    // textTheme: TextTheme(

    // )

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color:  Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.greyBlue,
        fontSize: 20,
      )
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.greenMaterial[900]!),
        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            // side: BorderSide(width: 1.0, color: AppColors.greenMaterial[900]!),
            borderRadius: BorderRadius.circular(2.0),
            ),   
        )
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.clearBlueMaterial[900]!),
        textStyle:MaterialStateProperty.resolveWith<TextStyle>(
          (states) => TextStyle(color: AppColors.clearBlueMaterial[900]),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(width: 1.0, color: AppColors.greenMaterial[900]!),
            borderRadius: BorderRadius.circular(2.0),
            ),   
      ),
    ),
    ),

    inputDecorationTheme:  InputDecorationTheme(
      hintStyle: const TextStyle(
        color: AppColors.redDarkBlue,
      ),
      labelStyle: const TextStyle(
        color: AppColors.grey,
      ),
      iconColor: AppColors.greenMaterial[900],
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0)))
    )

  ) ;

  // static final darkTheme ;
}