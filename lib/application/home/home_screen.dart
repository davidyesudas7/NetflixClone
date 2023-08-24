import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_card.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_card.dart';

import 'package:nextflix_clone/application/home/bloc/home_bloc_bloc.dart';
import 'package:nextflix_clone/application/home/widgets/background_image_card.dart';
import 'package:nextflix_clone/application/home/widgets/custum_appbar.dart';
import 'package:nextflix_clone/application/home/widgets/number_card.dart';
import 'package:nextflix_clone/application/home/widgets/number_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBlocBloc>(context).add(HomeBlocDataCallinEvent());
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
            //'https://image.tmdb.org/t/p/original/e3NBGiAifW9Xt8xD5tpARskjccO.jpg'
          },
          child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
            builder: (context, state) {
              if (state is HomeBlocloadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeBlocErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is HomeBlocPosterlistState) {
                return SizedBox(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          BackgroundImageCard(
                            backgroundimage:
                                state.trendinglist[0].results[0].posterPath,
                          ),
                          MainTitleCard(
                            title: 'Trendin Now',
                            mainCards: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.trendinglist[0].results.length,
                              itemBuilder: (context, index) => MainCard(
                                  posterimage: state.trendinglist[0]
                                      .results[index].posterPath),
                            ),
                          ),
                          MainTitleCard(
                            title: 'Popular Tv Shows',
                            mainCards: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.tvlist[0].results.length,
                              itemBuilder: (context, index) => MainCard(
                                  posterimage: state
                                      .tvlist[0].results[index].posterPath),
                            ),
                          ),
                          MainTitleCard(
                            title: 'Favourite Movies',
                            mainCards: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movielist[0].results.length,
                              itemBuilder: (context, index) => MainCard(
                                  posterimage: state
                                      .movielist[0].results[index].posterPath),
                            ),
                          ),
                          MainTitleCard(
                            title: 'Most Popular',
                            mainCards: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.popularlist[0].results.length,
                              itemBuilder: (context, index) => MainCard(
                                  posterimage: state.popularlist[0]
                                      .results[index].posterPath),
                            ),
                          ),
                          NumberTitleCard(
                            numberCards: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) => NumberCard(
                                  index: index,
                                  posterpath: state
                                      .movielist[0].results[index].posterPath),
                            ),
                          ),
                        ],
                      ),
                      const CustumAppBar()
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    ));
  }
}
