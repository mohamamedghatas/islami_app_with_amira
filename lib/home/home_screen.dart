import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth.dart';
import 'package:islami_app/home/tabs/quran/quran.dart';
import 'package:islami_app/home/tabs/radio.dart';
import 'package:islami_app/home/tabs/sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/tabs/setting/settings_tab.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';


import 'bottom_navigation_icon.dart';

class Home_Screeen extends StatefulWidget {
  static const String routeName = 'home';

  Home_Screeen({super.key});

  @override
  State<Home_Screeen> createState() => _Home_ScreeenState();
}

class _Home_ScreeenState extends State<Home_Screeen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguageProvider>(context);
    return Stack(
      children: [

        provider.isDarkMode()? Image(

          image: AssetImage(
            'assets/images/dark_bg.png',
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ):


    Image(

          image: AssetImage(
            'assets/images/default_bg.png',
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ), //كتبت انه ياخود ثيم الابلكيشن واديله
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },

              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    ),
                    label:  AppLocalizations.of(context)!.quran,),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    ),
                    label:  AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    ),
                    label:  AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    ),
                    label:  AppLocalizations.of(context)!.radio,),
                BottomNavigationBarItem(
                    icon:Icon (Icons.settings),
                    label:  AppLocalizations.of(context)!.settings),


              ],
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }
  List<Widget> tabs=[
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),settingsTab()

  ];
}
