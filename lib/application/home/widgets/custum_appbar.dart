import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/avatar.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/home/home_screen.dart';

class CustumAppBar extends StatelessWidget {
  const CustumAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, value, _) {
        return Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppbarTopSection(),
                kHeight,
                // ignore: unrelated_type_equality_checks
                scrollnotifier.value == true
                    ? const AppBarBottomSection()
                    : kHeight
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppbarTopSection extends StatelessWidget {
  const AppbarTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
          height: 50,
          width: 50,
        ),
        const Row(
          children: [SearchButton(), kWidth, Avatar()],
        )
      ],
    );
  }
}

class AppBarBottomSection extends StatelessWidget {
  const AppBarBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('TvShows'),
        Text('Movies'),
        Row(
          children: [Text('Categories'), Icon(Icons.arrow_drop_down)],
        )
      ],
    );
  }
}
