import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/home/widgets/buttons.dart';

class BackgroundImageCard extends StatelessWidget {
  const BackgroundImageCard({
    super.key,
    required this.backgroundimage,
  });

  final String backgroundimage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('$imagestraturl$backgroundimage'))),
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
