import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/avatar.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';

import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/new&hot/widgets/commin_soon_data_card.dart';
import 'package:nextflix_clone/application/new&hot/widgets/watching_condent.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New & Hot',
                    style: kAppbarTextstyle,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          size: 30,
                        ),
                      ),
                      const SearchButton(),
                      kWidth,
                      const Avatar(),
                    ],
                  )
                ],
              ),
              bottom: TabBar(
                  indicator: BoxDecoration(
                      color: kWhitecolor, borderRadius: kBorderradius20),
                  labelColor: kBlackcolor,
                  unselectedLabelColor: kWhitecolor,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: '🍿 Comming Soon',
                    ),
                    Tab(
                      text: '🔥Everyone\'s Watching',
                    )
                  ]),
            ),
          ),
          body: const TabBarView(
              children: [CommingSoonTab(), EveryoneIswatchingTab()])),
    );
  }
}

class CommingSoonTab extends StatelessWidget {
  const CommingSoonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(10, (index) => const CommingSoonDataCard()));
  }
}

class EveryoneIswatchingTab extends StatelessWidget {
  const EveryoneIswatchingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(10, (index) => const WatchingCondentCard()));
  }
}
