import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/home/widgets/buttons.dart';

class BackgroundImageCard extends StatelessWidget {
  const BackgroundImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2/6rUEaM2NQiDNdAlNAo09w8FoLGN.jpg'))),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                buttonname: 'My List',
                icon: Icons.add,
              ),
              PlayButton(),
              CustomButton(icon: Icons.info_outline, buttonname: 'info')
            ],
          ),
        )
      ],
    );
  }
}
