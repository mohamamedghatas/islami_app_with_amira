import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    return Container(

      color:provider.isDarkMode()?AppColors.primaryDarkColor: AppColors.whiteColor,

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                ///change language to english
                provider.changeLanguage('en');
              },
              child: provider.appLanguage=='en'?
                  getSelectedItemWidget(AppLocalizations.of(context)!.english):
                  getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                ///change language to arabic
                provider.changeLanguage('ar');

              },
              child: provider.appLanguage=='ar'?
                  getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
                  getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider=Provider.of<AppLanguageProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
          provider.isDarkMode()?Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.whiteColor):
          Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.primaryLightColor),
        ),
        Icon(
          Icons.done,
          size: 35,color:provider.isDarkMode()?AppColors.whiteColor: AppColors.primaryLightColor,
        ),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text) {
    var provider=Provider.of<AppLanguageProvider>(context);

    return Text(
      text,
      style:
      provider.isDarkMode()? Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.yellowColor):
      Theme.of(context).textTheme.bodySmall,

    );
  }
}
