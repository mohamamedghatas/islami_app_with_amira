
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/app_language_provider.dart';

import 'home/home_screen.dart';
import 'home/tabs/hadeth/hadeth_details_screen.dart';
import 'home/tabs/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
create: (context) =>AppLanguageProvider() ,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screeen.routeName,
      routes: {
        Home_Screeen.routeName: (context) => Home_Screeen(),
        SuraDetailsScreen.routeName:(context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(context) => HadethDetailsScreen(),
      },
      themeMode: provider.appTheme ,
      theme: myThemeData.lightmode ,
      darkTheme: myThemeData.darktmode,
      locale: Locale(provider.appLanguage) ,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
