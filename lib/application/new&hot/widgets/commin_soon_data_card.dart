import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class CommingSoonDataCard extends StatelessWidget {
  const CommingSoonDataCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 400,
      child: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [ReleaseDate(), ReleaseCondet()],
        ),
      ),
    );
  }
}

class ReleaseCondet extends StatelessWidget {
  const ReleaseCondet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(borderRadius: kBorderradius10),
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://image.tmdb.org/t/p/original/qWiUnM2CEoYQ3pzpB9TBVV2r8L5.jpg',
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CircleAvatar(
                    backgroundColor: kBackgroundcolor,
                    radius: 16,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          size: 16,
                        ))),
              )
            ],
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/en/thumb/2/2c/One_Piece_Logo.svg/1200px-One_Piece_Logo.svg.png',
                height: 50,
                width: 150,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              )
            ],
          ),
          kHeight20,
          const Text(
            'Watch New Episodes Now',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          kHeight,
          const Text(
            'Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous "One Piece" behind. Whoever claims the "One Piece" will be named the new King of the Pirates.',
            style: TextStyle(fontSize: 12, color: kGreycolor),
          ),
          kHeight
        ],
      ),
    );
  }
}

class ReleaseDate extends StatelessWidget {
  const ReleaseDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SEP',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: kGreycolor),
            ),
            Text(
              '01',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
