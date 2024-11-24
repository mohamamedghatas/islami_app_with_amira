import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

import 'item_sura_detels.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      LoadFile(args.index);
    }
    var provider=Provider.of<AppLanguageProvider>(context);


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
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ), //كتبت انه ياخود ثيم الابلكيشن واديله
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ))
            : //loading icon
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.06),
                decoration: BoxDecoration(


                    color:
                    provider.isDarkMode()?
                        AppColors.primaryDarkColor:
                    AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color:
                      provider.isDarkMode()?AppColors.yellowColor:
                      AppColors.primaryLightColor,
                      thickness: 1.5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      content: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  void LoadFile(
      int index) async //رقم الفايل السورة وبيبدا من الصفر /استخدمتasync وawait عشان مشكلة الفيوتشر استرنج
  {
    String content = await rootBundle
        .loadString('assets/files/${index + 1}.txt'); //لقراءه الفايل

    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
