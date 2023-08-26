import 'package:flutter/material.dart';

import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

// 'https://image.tmdb.org/t/p/original/qWiUnM2CEoYQ3pzpB9TBVV2r8L5.jpg',background image demo
class CommingSoonDataCard extends StatelessWidget {
  const CommingSoonDataCard({
    super.key,
    required this.backgroundimage,
    required this.moviename,
    required this.moviedescription,
    required this.releasemonth,
    required this.releaseday,
  });
  final String backgroundimage;
  final String moviename;
  final String moviedescription;
  final String releasemonth;
  final String releaseday;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            ReleaseDate(releasemonth: releasemonth, releaseday: releaseday),
            ReleaseCondet(
              moviename: moviename,
              backgroundimage: backgroundimage,
              moviedescription: moviedescription,
            )
          ],
        ),
      ),
    );
  }
}

class ReleaseCondet extends StatelessWidget {
  const ReleaseCondet({
    super.key,
    required this.backgroundimage,
    required this.moviename,
    required this.moviedescription,
  });
  final String backgroundimage;
  final String moviename;
  final String moviedescription;

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
                    fit: BoxFit.cover, '$imagestraturl$backgroundimage'),
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
              Expanded(
                  child: Text(
                overflow: TextOverflow.ellipsis,
                moviename,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
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
          Expanded(
            child: Text(
              overflow: TextOverflow.clip,
              moviedescription,
              style: const TextStyle(fontSize: 12, color: kGreycolor),
            ),
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
    required this.releasemonth,
    required this.releaseday,
  });
  final String releasemonth;
  final String releaseday;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              releasemonth,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: kGreycolor),
            ),
            Text(
              releaseday,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
