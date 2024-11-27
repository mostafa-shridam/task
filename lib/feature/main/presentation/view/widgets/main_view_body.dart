import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/assets.dart';
import 'package:task/feature/home/presentation/view/home_view.dart';

List<BottomNavigationBarItem> items =  [
  BottomNavigationBarItem(
    activeIcon:  SvgPicture.asset(Assets.assetsImagesCalendar1),
    icon: SvgPicture.asset(Assets.assetsImagesCalendar),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(Assets.assetsImagesTaskSquare,),
    label: "Tasks",
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(Assets.assetsImagesNote2,),
    label: "Memos",
  ),
  BottomNavigationBarItem(
    icon:SvgPicture.asset(Assets.assetsImagesNotificationStatus,),
    label: "Reminder",
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(Assets.assetsImagesFolder2,),
    label: "Archive",
  ),
];

List<Widget> screens = const [
  HomeView(),
  Center(child: Text("Tasks")),
  Center(child: Text("Memos")),
  Center(child: Text("Reminder")),
  Center(child: Text("Archive")),
];

List<String> title = [
  "",
  "Tasks",
  "Memos",
  "Reminder",
  "Archive",
];
