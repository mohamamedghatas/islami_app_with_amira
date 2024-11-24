 import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';

import 'hadeth.dart';
import 'hadeth_details_screen.dart';

class ItemHadethName extends StatelessWidget {

  Hadeth hadeth;
  ItemHadethName({required this.hadeth,super.key});

   @override
   Widget build(BuildContext context) {
     return InkWell(
       onTap: () {
 Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,arguments: hadeth);

       },
       child: Text(hadeth.title,
         textAlign: TextAlign.center,
         style:Theme.of(context).textTheme.bodySmall ,),
     );
   }
 }
