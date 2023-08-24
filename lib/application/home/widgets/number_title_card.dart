import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';
import 'package:nextflix_clone/application/home/widgets/number_card.dart';
import 'package:nextflix_clone/data/Homedata/home_page_model.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterlist,
  });

  final List<HomeResult> posterlist;

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  posterlist.length,
                  (index) => NumberCard(
                        index: index,
                        posterpath:
                            '$imagestraturl${posterlist[index].posterPath}',
                      )),
            ),
          ),
          kHeight
        ],
      ),
    );
  }
}
