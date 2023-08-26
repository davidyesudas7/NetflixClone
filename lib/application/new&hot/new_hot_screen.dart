import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/avatar.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/new&hot/bloc/new_and_hot_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(NewMovieDataEvent());
    });
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state is NewAndHotLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewAndHotErrorState) {
          Center(
            child: Text(state.message),
          );
        } else if (state is NewAndHotMovieLoadedState) {
          return ListView.builder(
              itemCount: state.movielist.length,
              itemBuilder: (context, index) {
                final formateddate = DateFormat.yMMMMd('en_US')
                    .format(state.movielist[index].releaseDate);
                return CommingSoonDataCard(
                    backgroundimage: state.movielist[index].backdropPath,
                    moviename: state.movielist[index].originalTitle,
                    moviedescription: state.movielist[index].overview,
                    releaseday:
                        state.movielist[index].releaseDate.day.toString(),
                    releasemonth: formateddate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase());
              });
        }
        return const SizedBox();
      },
    );
  }
}

class EveryoneIswatchingTab extends StatelessWidget {
  const EveryoneIswatchingTab({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<NewAndHotBloc>(context).add(NewTvDataEvent());
      },
    );
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state is NewAndHotLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewAndHotErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is NewAndHotTvLoadedState) {
          return ListView.builder(
            itemCount: state.tvlist.length,
            itemBuilder: (context, index) => WatchingCondentCard(
              backgroundimage: state.tvlist[index].backdropPath,
              tvdescription: state.tvlist[index].overview,
              tvname: state.tvlist[index].originalName,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
