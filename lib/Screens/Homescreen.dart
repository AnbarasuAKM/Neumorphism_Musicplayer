import 'package:flutter/material.dart';
import 'package:musicplayee/bottomnavi.dart';
import 'package:musicplayee/Models/songModel.dart';
import '../Models/PlaylistModel.dart';
import '../Models/PlayerlistCard.dart';
import '../Models/SearchBar.dart';
import '../Models/TrendingCard.dart';
import '../Widgets/SectionHeader.dart';

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

 final List<Song> songs = Song.songs;
 final List<Playlist>playlist=Playlist.playlist;



  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE0E5EC),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: const Icon(
                Icons.grid_view,
                size: 30,
                color: Colors.orangeAccent,
              ),
              actions: [
                const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/good.webp"),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              elevation: 0,
            )),
        bottomNavigationBar: const CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(songs: songs),
              Column(
                children: [
                  const SectionHeader(tittle: "Playlist", actions: "Viewmore"),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: playlist.length,
                      itemBuilder: (context,index){
                        return PlaylistCard(playlist: playlist[index]);
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}








// class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
//   const _CustomAppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(56.0);
//
// }
// }
// backgroundColor: Color(0xffE0E5EC),body: Center(
// child: Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(
// color: Color(0xffE0E5EC),
// borderRadius: BorderRadius.circular(12),
// boxShadow: [
// //darker shadow..
// BoxShadow(
// color: Color(0xff000000).withOpacity(0.3),
// blurRadius: 15,
// offset: Offset(5, 5)
// ),
// BoxShadow(
// //light shadow..
// color: Color(0xffFFFFFF).withOpacity(0.9),
// blurRadius: 15,
// offset: Offset(-5, -5)
// ),
// ]
//
// ),
// ),
// ),
