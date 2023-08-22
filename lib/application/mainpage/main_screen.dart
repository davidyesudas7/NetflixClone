import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/Games/games_screen.dart';
import 'package:nextflix_clone/application/common_widgets&constants/bottom_nav.dart';
import 'package:nextflix_clone/application/downloades/downloads.dart';
import 'package:nextflix_clone/application/home/home_screen.dart';
import 'package:nextflix_clone/application/new&hot/new_hot_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List pages = [
    const Homescreen(),
    const Gamescreen(),
    const NewAndHot(),
    const Downloads()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexchangenotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
