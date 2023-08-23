import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_card.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';

class SearchOnchangedWidget extends StatelessWidget {
  final List<OnSearchEntity> posterlist;
  const SearchOnchangedWidget({super.key, required this.posterlist});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        const MainTitleText(
          title: 'Top Searches: TV Shows & Movies',
        ),
        kHeight,
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 3 / 4,
          children: List.generate(
              posterlist.length,
              (index) => MainCard(
                    posterimage:
                        '$imagestraturl${posterlist[index].posterPath}',
                  )),
        ),
      ]),
    );
  }
}
