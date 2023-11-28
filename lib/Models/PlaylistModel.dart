import 'songModel.dart';

class Playlist{
   final String tittle;
   final List<Song>songs;
   final String imageurl;

  Playlist({required this.tittle, required this.songs, required this.imageurl});
  static List<Playlist>playlist=[Playlist(
    tittle:"SongName1",
    songs:Song.songs,
    imageurl:"https://e1.pxfuel.com/desktop-wallpaper/692/559/desktop-wallpaper-sillunu-oru-kadhal-thumbnail.jpg"
  ),
   Playlist(
   tittle:"SongName2",
   songs:Song.songs,
   imageurl:"https://e1.pxfuel.com/desktop-wallpaper/692/559/desktop-wallpaper-sillunu-oru-kadhal-thumbnail.jpg"
   ),
   Playlist(
   tittle:"SongName3",
   songs:Song.songs,
   imageurl:"https://e1.pxfuel.com/desktop-wallpaper/692/559/desktop-wallpaper-sillunu-oru-kadhal-thumbnail.jpg"
   )
  ];

}