import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/colors/colors.dart';
import 'package:nextflix_clone/application/common_widgets&constants/buttons.dart';
import 'package:nextflix_clone/application/common_widgets&constants/constants.dart';
import 'package:nextflix_clone/application/common_widgets&constants/main_title_text.dart';
import 'package:nextflix_clone/application/downloades/bloc/download_bloc.dart';
import 'package:nextflix_clone/application/downloades/widgets/download_image_widgets.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DownloadBloc>(context).add(DownloadeposterPathEvent());
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Downloads',
                    style: kAppbarTextstyle,
                  ),
                  Row(
                    children: [
                      const SearchButton(),
                      kWidth,
                      Container(
                        height: 40,
                        width: 40,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.settings),
                      kWidth,
                      Text(
                        'Smart Downloads',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        const MainTitleText(title: 'Turn on Downloads for You'),
                        kHeight,
                        const Text(
                          'We will download movies and shows just for you ,so \n you will always have something to watch.',
                          style: TextStyle(fontSize: 14, color: kGreycolor),
                        ),
                        kHeight,
                        SizedBox(
                          width: double.infinity,
                          height: 270,
                          child: BlocBuilder<DownloadBloc, DownloadState>(
                            builder: (context, state) {
                              if (state is DownloadLoadinng) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is DownloadLoaded) {
                                return Center(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 120,
                                        backgroundColor: Color(0xff2E2E2E),
                                      ),
                                      DownloadImageWidget(
                                        hieght: 170,
                                        width: 120,
                                        left: 170,
                                        bottom: 10,
                                        angle: 15,
                                        image:
                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${state.posterpath[0].posterpath}',
                                      ),
                                      DownloadImageWidget(
                                        angle: -15,
                                        right: 170,
                                        hieght: 170,
                                        width: 120,
                                        bottom: 10,
                                        image:
                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${state.posterpath[2].posterpath}',
                                      ),
                                      DownloadImageWidget(
                                        image:
                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${state.posterpath[1].posterpath}',
                                      ),
                                    ],
                                  ),
                                );
                              } else if (state is DownloadeError) {
                                return Center(
                                  child: SizedBox(
                                    child: Text(state.message),
                                  ),
                                );
                              }
                              return const Center(
                                child: SizedBox(),
                              );
                            },
                          ),
                        ),
                        kHeight,
                        MaterialButton(
                          onPressed: () {},
                          color: kBluecolor,
                          minWidth: double.infinity,
                          height: 50,
                          child: const Text('Set Up'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: MaterialButton(
                            onPressed: () {},
                            color: const Color(0xff2E2E2E),
                            minWidth: 160,
                            height: 30,
                            child: const Text('Find More to Download'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
