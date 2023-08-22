import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/avatar.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/search/bloc/search_bloc.dart';
import 'package:nextflix_clone/application/search/widgets/search_idle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchInitializedEvent());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Avatar(),
              ],
            ),
            kHeight,
            CupertinoSearchTextField(
              onChanged: (value) {
                BlocProvider.of<SearchBloc>(context)
                    .add(OnSearchingEvent(searchvaue: value));
              },
              itemColor: Colors.white,
              style: const TextStyle(color: kWhitecolor),
            ),
            kHeight20,
            // SearchIdleWidget()
            const SearchIdleWidget()
          ],
        ),
      ),
    );
  }
}
