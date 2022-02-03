import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/constants.dart';
import 'package:flutter_application_2/pages/widgets/header.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'widgets/playList.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      /* body: Column(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Header(),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            color: Colors.yellow,
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                //Header(),
                PlayList(),

                //DescriptionCourse(recommend: recommend),
                SliverToBoxAdapter(child: const SizedBox(height: 90)),
              ],
            ),
          ),
        ],
      ), */
      body: Stack(
        children: [
          //Header(),
          Positioned.fill(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              //physics: NeverScrollableScrollPhysics(),
              slivers: [
                Header(
                  path:
                      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                ),
                SliverPersistentHeader(
                  pinned: true,
                  //floating: true,
                  delegate: SliverCustomHeaderDelegate(
                    maxHeight: 50,
                    minHeight: 50,
                    child: Container(
                      color: Colors.yellow,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Equipo de trabajo',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                /*    List.generate(
                  8,
                  (index) => Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: CircleAvatar(),
                  ),
                ), */
                for (int i = 0; i < 6; i++) PlayList(),

                /*     PlayList(),
                PlayList(),
                PlayList(), */

                //DescriptionCourse(recommend: recommend),
                SliverToBoxAdapter(child: const SizedBox(height: 90)),
              ],
            ),
          ),
          //NavigationBar(),
        ],
      ),
      //body: Example3(),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
