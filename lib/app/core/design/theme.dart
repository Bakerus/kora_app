import 'package:flutter/material.dart';
import 'package:kora/app/core/design/colors.dart';

class AppTheme {
  static final ligthTheme = ThemeData(
      fontFamily: "Raleway",
      // primarySwatch:AppColors.greenMaterial,
      // primaryColor: AppColors.greenMaterial[900],
      // hintColor: AppColors.greenMaterial[900],

      iconTheme: const IconThemeData(
        color: Color.fromRGBO(217, 217, 217, 1),
        size: 8,
      ),

      
      textTheme: TextTheme(
        headline3: TextStyle(
          color: AppColors.greenMaterial[900],
          fontSize: 40.0,
          fontWeight: FontWeight.w700,
        ),

        headline4: TextStyle(
            color: AppColors.clearBlueMaterial[900],
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat"),

        headline6: TextStyle(
            color: AppColors.clearBlueMaterial[900],
            fontSize: 55.0,
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat"),    

        headline2: const TextStyle(
            color: AppColors.greyBlue,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Montserrat"),    


        subtitle1: const TextStyle(
          color: AppColors.redDarkBlue,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins",
        ),

        subtitle2: const TextStyle(
            color: AppColors.greyBlue,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),

        button: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),

        headline5: TextStyle(
            color: AppColors.clearBlueMaterial[900],
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto"),

        bodyText2: const TextStyle(
            color: AppColors.clearGrey,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),

        bodyText1: const TextStyle(
            color: AppColors.darkgGrey,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),

      ),


      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: AppColors.greyBlue,
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700
          ),
          iconTheme: IconThemeData(color: AppColors.greenMaterial[900], size: 14)
          ),

          
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding:MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:16, horizontal:127)),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.greenMaterial[900]!),
            foregroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
         // side: BorderSide(width: 1.0, color: AppColors.greenMaterial[900]!),
                borderRadius: BorderRadius.circular(5.0),
              ),
            )),
      ),


      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
          foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.clearBlueMaterial[900]!),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) => TextStyle(color: AppColors.clearBlueMaterial[900]),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side:
                  BorderSide(width: 3.0, color: AppColors.greenMaterial[900]!),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),


      inputDecorationTheme: InputDecorationTheme(
        
          hintStyle: const TextStyle(
            color: AppColors.redDarkBlue,
          ),
          labelStyle: const TextStyle(
            color: AppColors.grey,
          ),
          iconColor: AppColors.greenMaterial[500],
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color.fromRGBO(226, 227, 228, 1)),
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0)))
                  ),

              

  ); 
  
  // static final darkTheme ;
}
