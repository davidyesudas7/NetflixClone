import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class WatchingCondentCard extends StatelessWidget {
  const WatchingCondentCard({
    super.key,
    required this.backgroundimage,
    required this.tvname,
    required this.tvdescription,
  });
  final String backgroundimage;
  final String tvname;
  final String tvdescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: double.infinity,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
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
                tvname,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
              const CustomButton(
                buttonname: 'Share',
                icon: Icons.share,
              ),
              const CustomButton(
                buttonname: 'My List',
                icon: Icons.add,
              ),
              const CustomButton(
                buttonname: 'Play',
                icon: Icons.play_arrow,
              ),
            ],
          ),
          kHeight20,
          Expanded(
            child: Text(
              overflow: TextOverflow.clip,
              tvdescription,
              style: const TextStyle(fontSize: 12, color: kGreycolor),
            ),
          ),
        ],
      ),
    );
  }
}
