import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../quran/item_sura_name.dart';
import 'item_hadeth_name.dart';

class HadethTab extends StatefulWidget {


   HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth>ahadethList=[];

  @override
  Widget build(BuildContext context) {
    LoadHadethFile();
    return   Column(
      children: [
        Expanded(
            child: Image.asset(
              'assets/images/hadeth_logo.png',
            )),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 2.5,
        ),
        Text(
    AppLocalizations.of(context)!.hadeth_name,

          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 2.5,
        ),
        Expanded(
          flex: 2,
          child:
          ahadethList.isEmpty?
              Center(child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ))
              :
          ListView.separated(
            separatorBuilder:(context, index){
              return Divider(
                color: AppColors.primaryLightColor,
                thickness: 1.5,
              );

            },
            itemBuilder: (context, index) {
              return ItemHadethName(hadeth:  ahadethList[index]);
            },
            itemCount: ahadethList.length,
          ),
        )
      ],
    );
  }

  void LoadHadethFile()async{

 String hadethContent= await rootBundle.loadString('assets/files/ahadeth.txt');
List<String> hadethList= hadethContent.split('#\r\n');
for(int i=0; i<hadethList.length;i++){
List <String> hadethlines= hadethList[i].split('\n');
 String title= hadethlines[0];
   hadethlines.removeAt(0);
   Hadeth hadeth=Hadeth(title: title, content: hadethlines);
   ahadethList.add(hadeth);
   setState(() {

   });

}

  }
}
class Hadeth{
  String title;
  List<String>content;

  Hadeth({required this.title, required this.content});
}

