import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';


class ItemHadethDetails extends StatelessWidget {
  String content;
  ItemHadethDetails({required this.content,super.key});

  @override
  Widget build(BuildContext context) {
    var porvider=Provider.of<AppLanguageProvider>(context);
    return Text(
      '$content ',
      style:
      porvider.isDarkMode()?Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.yellowColor):
      Theme.of(context).textTheme.titleLarge,textDirection: TextDirection.rtl,

    );
  }
}
