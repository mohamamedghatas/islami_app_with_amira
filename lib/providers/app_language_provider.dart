import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {


  String appLanguage="en";
  ThemeMode appTheme=ThemeMode.light;
  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage){

      return;
    }
    appLanguage=newLanguage;

notifyListeners();
  }
  void changeTheme(ThemeMode newMode ){
    if(appTheme ==newMode){
      return ;

    }appTheme=newMode;
notifyListeners();
  }

  bool isDarkMode(){

    return appTheme==ThemeMode.dark;
  }
}