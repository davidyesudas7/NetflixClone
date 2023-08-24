// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_card.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';
import 'package:nextflix_clone/data/Homedata/home_page_model.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterlist,
  });
  final List<HomeResult> posterlist;

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
          LimitedBox(
            maxHeight: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  posterlist.length,
                  (index) => MainCard(
                        posterimage: posterlist[index].posterPath,
                      )),
            ),
          ),
          kHeight
        ],
      ),
    );
  }
}
