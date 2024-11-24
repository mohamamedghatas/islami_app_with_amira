import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

import 'item_hadeth_detels.dart';

class HadethDetailsScreen extends StatefulWidget {

  static const String routeName = 'HadethDetailsScreen';

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguageProvider>(context);
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Hadeth;


    return Stack(children: [
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
            args.title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ), //كتبت انه ياخود ثيم الابلكيشن واديله
        ),
        body:
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05,
              vertical: MediaQuery
                  .of(context)
                  .size
                  .height * 0.06),
          decoration: BoxDecoration(
              color:

              provider.isDarkMode()?AppColors.primaryDarkColor:
              AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(



            itemBuilder: (context, index) {
              return ItemHadethDetails(
                content: args.content[index],
              );
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}