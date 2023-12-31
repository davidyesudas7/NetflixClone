// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.mainCards,
  });
  final ListView mainCards;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitleText(
            title: title,
          ),
          LimitedBox(maxHeight: 150, child: mainCards),
          kHeight
        ],
      ),
    );
  }
}
