import 'package:flutter/material.dart';

import 'PlaylistModel.dart';
import 'package:get/get.dart';
class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/playlist',arguments: playlist);
      },
      child: Container(
        height: 75,
        margin:  const EdgeInsets.only(bottom: 15,),
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color:Color(0xffE0E5EC) ,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            //darker shadow..
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(5, 5)),
            BoxShadow(
              //light shadow..
                color: Color(0xffFFFFFF).withOpacity(0.9),
                blurRadius: 15,
                offset: Offset(-5, -5)),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
                borderRadius:BorderRadius.circular(10),
                child: Image.network(playlist.imageurl,
                  height: 55,
                  width: 55,
                  fit: BoxFit.cover,)),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(playlist.tittle,style: Theme.of(context).textTheme.bodyLarge!.copyWith(),),
                  Text('${playlist.songs.length}songs',maxLines: 2,style:  Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon:Icon(Icons.play_circle,color: Colors.orangeAccent,))
          ],),
      ),
    );
  }
}
