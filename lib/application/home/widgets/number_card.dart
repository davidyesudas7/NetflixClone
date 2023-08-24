import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.posterpath});
  final int index;
  final String posterpath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 5,
          top: 40,
          child: BorderedText(
            strokeWidth: 3.0,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                letterSpacing: -25,
                color: Colors.black,
                fontSize: 100,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('$imagestraturl$posterpath'),
                  ),
                  borderRadius: kBorderradius10),
            ),
          ],
        ),
      ],
    );
  }
}
