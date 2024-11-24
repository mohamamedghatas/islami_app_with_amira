import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    return Container(
      color:provider.isDarkMode()?AppColors.primaryDarkColor: AppColors.whiteColor,

      // margin: EdgeInsets.all(25),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  ///change to dark
                  provider.changeTheme(ThemeMode.dark);
                },
                child: provider.isDarkMode()?
                getSelectedItemWidget(AppLocalizations.of(context)!.dark):
                getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  ///change  to light
                  provider.changeTheme(ThemeMode.light);

                },
                child: provider.isDarkMode()?
              getUnSelectedItemWidget(AppLocalizations.of(context)!.light):
                getSelectedItemWidget(AppLocalizations.of(context)!.light)
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppLanguageProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
          provider.isDarkMode()?Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color:AppColors.yellowColor):
          Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color:AppColors.primaryLightColor),
        ),
        Icon(
          Icons.done,
          size: 35,color:
        provider.isDarkMode()?AppColors.yellowColor:
        AppColors.primaryLightColor,
        ),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,

    );
  }
}
