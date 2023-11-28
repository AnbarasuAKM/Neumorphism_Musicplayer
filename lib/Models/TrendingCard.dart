

import 'package:flutter/material.dart';
import 'package:musicplayee/Models/songModel.dart';

import '../Widgets/SectionHeader.dart';
import '../Widgets/Songcard.dart';

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(
              tittle: "Trending Music", actions: "Viewmore"),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Songcard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
