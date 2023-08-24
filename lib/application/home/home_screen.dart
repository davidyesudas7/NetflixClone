import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/common_widgets&constants/Main_title_card.dart';
import 'package:nextflix_clone/application/home/bloc/home_bloc_bloc.dart';
import 'package:nextflix_clone/application/home/widgets/background_image_card.dart';
import 'package:nextflix_clone/application/home/widgets/custum_appbar.dart';
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
                                state.posterlist[1].results[0].posterPath,
                          ),
                          MainTitleCard(
                            posterlist: state.posterlist[0].results,
                            title: 'Supernatural Tv Shows',
                          ),
                          MainTitleCard(
                            posterlist: state.posterlist[1].results,
                            title: 'Trending Now',
                          ),
                          MainTitleCard(
                            posterlist: state.posterlist[2].results,
                            title: 'Anime',
                          ),
                          MainTitleCard(
                            posterlist: state.posterlist[3].results,
                            title: 'Hindi Movies&Tv',
                          ),
                          MainTitleCard(
                            posterlist: state.posterlist[2].results,
                            title: 'Epic Worlds',
                          ),
                          NumberTitleCard(
                            posterlist: state.posterlist[1].results,
                          )
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
