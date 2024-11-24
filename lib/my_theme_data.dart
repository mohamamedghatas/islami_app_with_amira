import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class myThemeData {
  // فيه شكل البرنامج وشكل البرنامج في الدارك والليت
  static ThemeData lightmode = ThemeData(
      primaryColor: AppColors.primaryLightColor,

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: AppColors.whiteColor,
          selectedIconTheme: IconThemeData(size: 45),
          unselectedIconTheme: IconThemeData(size: 35)),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
            color: AppColors.blackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));
  static ThemeData darktmode = ThemeData(
      primaryColor: AppColors.primaryDarkColor,

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color:AppColors.whiteColor),
          backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.yellowColor,
          unselectedItemColor: AppColors.whiteColor,
          selectedIconTheme: IconThemeData(size: 45),
          unselectedIconTheme: IconThemeData(size: 35)),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

}
