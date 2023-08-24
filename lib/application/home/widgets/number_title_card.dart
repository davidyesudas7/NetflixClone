import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.numberCards,
  });

  final ListView numberCards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitleText(
            title: 'Top 10 TV Shows in India Today',
          ),
          LimitedBox(
            maxHeight: 150,
            child: numberCards,
          ),
          kHeight
        ],
      ),
    );
  }
}
