import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';


class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
   ItemSuraDetails({required this.content,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguageProvider>(context);
    return Text(
      '$content (${index+1})',
      textAlign: TextAlign.center,
      style:provider.isDarkMode()?
      Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.yellowColor):

      Theme.of(context).textTheme.titleLarge,textDirection: TextDirection.rtl,

    );
  }
}
