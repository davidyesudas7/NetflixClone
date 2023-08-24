import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class MainCard extends StatelessWidget {
  final String posterimage;
  const MainCard({
    super.key,
    required this.posterimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 5),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage('$imagestraturl$posterimage'),
          ),
          borderRadius: kBorderradius10),
    );
  }
}
