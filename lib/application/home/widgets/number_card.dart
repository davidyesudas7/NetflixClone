import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
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
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w300_and_h450_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg'),
                  ),
                  borderRadius: kBorderradius10),
            ),
          ],
        ),
      ],
    );
  }
}
