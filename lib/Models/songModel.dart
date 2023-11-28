class Song{
  late final String tittle;
  late final String description;
  late final String url;
  late final String Coverurl;

  Song({
    required this.tittle,
    required this.description,
    required this.url,
    required this.Coverurl,
});

  static List<Song>songs=[
    Song(tittle: "Munbe Vaa", description: "Nala song", url: 'asset/audio/Munbe-Vaa-En-Vaa.mp3', Coverurl: 'https://i.pinimg.com/originals/88/dc/a0/88dca0b375e518dc0f68bbb681cbd3ea.jpg'),
    Song(tittle: "Partha Mudhal", description: "fav", url: 'asset/audio/Railin-Oligal-MassTamilan.dev.mp3', Coverurl: 'https://www.startmusically.com/wp-content/uploads/2023/06/manjal-veyil-maalyilae-music-from-vettaiyaadu-vilaiyaadu-movie-mp3-image-scaled.jpg'),
    Song(tittle: "Railin oligal", description: "So Beautifull", url: 'asset/audio/Munbe-Vaa-En-Vaa.mp3', Coverurl: 'https://i.ytimg.com/vi/Hhiy8T4Zb3c/sddefault.jpg'),
    Song(tittle: "Ven Megham", description: "Awsoeme", url: 'asset/audio/Railin-Oligal-MassTamilan.dev.mp3', Coverurl: 'https://c.saavncdn.com/894/Yaaradi-Nee-Mohini-Tamil-2008-20200620135829-500x500.jpg'),
  ];
}