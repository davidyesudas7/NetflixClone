import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';

class WatchingCondentCard extends StatelessWidget {
  const WatchingCondentCard({
    super.key,
  });

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
                  fit: BoxFit.cover,
                  'https://image.tmdb.org/t/p/w533_and_h300_bestv2/i2GVEvltEu3BXn5crBSxgKuTaca.jpg',
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
                'https://seeklogo.com/images/I/insidious-logo-79753F44E8-seeklogo.com.png',
                height: 50,
                width: 150,
              ),
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
          const Text(
            'To put their demons to rest once and for all, Josh Lambert and a college-aged Dalton Lambert must go deeper into The Further than ever before, facing their family\'s dark past and a host of new and more horrifying terrors that lurk behind the red door.',
            style: TextStyle(fontSize: 12, color: kGreycolor),
          ),
        ],
      ),
    );
  }
}
