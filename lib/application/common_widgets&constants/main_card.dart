import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 5),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.red,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/original/e3NBGiAifW9Xt8xD5tpARskjccO.jpg'),
          ),
          borderRadius: kBorderradius10),
    );
  }
}
