import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';
import 'package:nextflix_clone/application/search/bloc/search_bloc.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        const MainTitleText(
          title: 'Top Searches: TV Shows & Movies',
        ),
        kHeight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is Searchloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchInitializedState) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    debugPrint(state.initialdata[index]!.maintitle.toString());
                    return SearchIdleCard(
                      posterimage:
                          '$imagestraturl${state.initialdata[index]!.posterpath}',
                      title: state.initialdata[index]!.maintitle,
                    );
                  },
                  separatorBuilder: (context, index) => kHeight,
                  itemCount: state.initialdata.length);
            } else if (state is SearchError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox();
            }
          },
        )),
      ]),
    );
  }
}

class SearchIdleCard extends StatelessWidget {
  final String posterimage;
  final String title;
  const SearchIdleCard({
    super.key,
    required this.posterimage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: kBorderradius10,
            color: kBluecolor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(posterimage),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          radius: 17,
          backgroundColor: kGreycolor,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: kBlackcolor,
            child: Icon(Icons.play_arrow),
          ),
        )
      ],
    );
  }
}
