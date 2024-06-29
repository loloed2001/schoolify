

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Page {
  // Define a Page model if needed (replace with your actual properties)
  final String title;
  final String routeName; // Assuming you have routes defined

  const Page({required this.title, required this.routeName});
}

List<Page> pages = [
  // Create a well-defined pages list
  Page(title: 'Marks', routeName: '/markess'),
  Page(title: 'Inschool', routeName: '/inschool'),
  Page(title: 'Note', routeName: '/note'),
  Page(
      title: 'Exam Program',
      routeName: '/examprog'), // Adjust titles and routes as needed
  Page(title: 'Week Program', routeName: '/weekprg'),
  Page(title: 'Lesson', routeName: '/lesson'),
];
List name = [
  "العلامات",
  "الحضور",
 "الملاحظات",
 "برنامج المذاكرات",
  "برنامج الاسبوع",
 "دروسي"
];
List<Color> ccolors = [
  Color(0xffffcf2f),
  Color(0xff6fe08d),
  Color(0xff61bdfd),
  Color(0xfffc7f7f),
  Color(0xffcb84fb),
  Color(0xff78e667),
];

List<Icon> caticon = [
  Icon(
    Icons.bar_chart_outlined,
    color: Colors.white,
    size: 30,
  ),
  Icon(
    Icons.boy_outlined,
    color: Colors.white,
    size: 30,
  ),
  Icon(
    Icons.note,
    color: Colors.white,
    size: 30,
  ),
  Icon(
    Icons.view_week,
    color: Colors.white,
    size: 30,
  ),
  Icon(
    Icons.list_alt_rounded,
    color: Colors.white,
    size: 30,
  ),
  Icon(
    Icons.auto_stories_sharp,
    color: Colors.white,
    size: 30,
  ),
];
List<String> itemlist = [
  "الأول",
  "الثاني",
  "الثالث",
  "الرابع",
  "الخامس",
  "السادس",
];
String getTitle(BuildContext context ,int index){
List<String> titles=[
AppLocalizations.of(context)!.mark,
AppLocalizations.of(context)!.inschool,
AppLocalizations.of(context)!.note,
AppLocalizations.of(context)!.exampro,
AppLocalizations.of(context)!.weekpro,
AppLocalizations.of(context)!.lesson,
];
return titles[index];
}
  
