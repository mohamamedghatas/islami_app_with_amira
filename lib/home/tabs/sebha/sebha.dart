import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class SebhaTab extends StatefulWidget {

   SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count=0;

  int index =0;
  double turn=0;

  final List<String>azkar=['سبحان الله','الحمد لله','لا اله الا الله','الله اكبر'];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppLanguageProvider>(context);
    return Column(

      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Align(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.017 ,left: MediaQuery.of(context).size.height*0.13 ),
            child:
            provider.isDarkMode()?Image.asset('assets/images/head_sebha_dark.png'):

            Image.asset('assets/images/head_sebha_logo.png'),
          ),
          Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.095 ),
              child: AnimatedRotation(
                  duration: Duration(milliseconds: 300),
                  turns: turn,//تلف بمقدار اد ايه
                  child:
                  provider.isDarkMode()?Image.asset('assets/images/body_sebha_dark.png'):
                  Image.asset('assets/images/body_sebha_logo.png'))),


        ],),

      ),
        SizedBox(height: 43,),
        Column(children: [
          Text(
         AppLocalizations.of(context)!.number_Of_Praising,style: TextStyle(color: provider.isDarkMode()?AppColors.whiteColor: AppColors.blackColor,fontSize: 25,fontWeight: FontWeight.w600),),
          SizedBox(height: 26,),
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(color:Theme.of(context).primaryColor.withOpacity(0.6),borderRadius: BorderRadius.circular(24), ),

            child: Text(count.toString()),
          ),
          SizedBox(height: 29,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:provider.isDarkMode()?AppColors.yellowColor : Theme.of(context).primaryColor ),
              onPressed: (){
                setState(() {
                  count++;
                  turn+=0.03;
                  if(count==34){

                    count=0;
                    index++;
                    if(index==azkar.length){
                      index=0;
                    }
                  }
                });

              }, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( azkar[index],style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              ))


        ],)

    ],);
  }
}
