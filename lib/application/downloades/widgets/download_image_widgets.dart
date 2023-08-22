import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      this.left = 0,
      this.right = 0,
      this.angle = 0,
      required this.image,
      this.hieght = 190,
      this.width = 140,
      this.bottom = 0});
  final double left;
  final double right;
  final double angle;
  final String image;
  final double hieght;
  final double width;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Padding(
        padding: EdgeInsets.only(left: left, right: right, bottom: bottom),
        child: Container(
          margin: const EdgeInsets.only(right: 10, top: 5),
          height: hieght,
          width: width,
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
              borderRadius: kBorderradius10),
        ),
      ),
    );
  }
}
