import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import 'language_bottom_sheet.dart';

class settingsTab extends StatefulWidget {
  const settingsTab({super.key});

  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:provider.isDarkMode()?AppColors.yellowColor: AppColors.primaryLightColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,color: provider.isDarkMode()?AppColors.whiteColor:
                  AppColors.blackColor,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              ShowThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:provider.isDarkMode()?AppColors.yellowColor: AppColors.primaryLightColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()?AppLocalizations.of(context)!.dark:
                        AppLocalizations.of(context)!.light

                  ),
                  Icon(
                    Icons.arrow_drop_down,color: provider.isDarkMode()?AppColors.whiteColor:
                    AppColors.blackColor,
                    size: 35,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void ShowLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void ShowThemeBottomSheet() {

    showModalBottomSheet(

      context: context, builder:(context) => ThemeBottomSheet() , );
  }
}
