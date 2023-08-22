import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nextflix_clone/application/common_widgets&constants/Main_title_card.dart';
import 'package:nextflix_clone/application/home/widgets/background_image_card.dart';
import 'package:nextflix_clone/application/home/widgets/custum_appbar.dart';
import 'package:nextflix_clone/application/home/widgets/number_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, value, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            debugPrint(direction.toString());
            if (direction == ScrollDirection.reverse) {
              return scrollnotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              return scrollnotifier.value == true;
            } else {
              return scrollnotifier.value = true;
            }
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundImageCard(),
                  MainTitleCard(
                    title: 'Supernatural Tv Shows',
                  ),
                  MainTitleCard(
                    title: 'Trending Now',
                  ),
                  MainTitleCard(
                    title: 'Anime',
                  ),
                  MainTitleCard(
                    title: 'Hindi Movies&Tv',
                  ),
                  MainTitleCard(
                    title: 'Epic Worlds',
                  ),
                  NumberTitleCard()
                ],
              ),
              const CustumAppBar()
            ],
          ),
        );
      },
    ));
  }
}
