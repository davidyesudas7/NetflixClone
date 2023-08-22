import 'package:flutter/material.dart';

ValueNotifier<int> indexchangenotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangenotifier,
      builder: (context, int newindex, child) {
        return BottomNavigationBar(
            currentIndex: newindex,
            onTap: (index) {
              indexchangenotifier.value = index;
            },
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.videogame_asset_outlined), label: 'Games'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined), label: 'New&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down), label: 'Downloads'),
            ]);
      },
    );
  }
}
