import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayee/Models/Neumorphicbtn.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../Models/songModel.dart';
import '../Models/PlayerButtons.dart';
import '../Widgets/SeekBar.dart';
import 'package:get/get.dart';

class SongScreen extends StatefulWidget {
  SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Song song = Get.arguments ?? Song.songs[0];

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse('asset:///${song.url}'),
        ),
        AudioSource.uri(
          Uri.parse('asset:///${Song.songs[1].url}'),
        ),
        AudioSource.uri(
          Uri.parse('asset:///${Song.songs[2].url}'),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Stream<SeekBarData> get SeekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MusicPlayer(
              song: song,
              SeekBarDataStream: SeekBarDataStream,
              audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required this.SeekBarDataStream,
    required this.audioPlayer,
    required this.song,
  });

  final Stream<SeekBarData> SeekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Neumorphism(
                size: 50,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.orangeAccent,
                    )),
              ),
              Text("Playing Now",
                  style: TextStyle(
                    fontFamily: "Tuesday",
                    fontSize: 17,
                    color: Color(0xff6c7a92),
                  )),
              Neumorphism(
                size: 50,
                child: Icon(
                  Icons.menu,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: size * 0.8,
          width: size * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  song.Coverurl,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(200),
            color: Color(0xffE0E5EC),
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
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          song.tittle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff6c7a92),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          song.description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff6c7a92),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 340,
          child: StreamBuilder<SeekBarData>(
              stream: SeekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.duration ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChanged: audioPlayer.seek,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: PlayerButtons(audioPlayer: audioPlayer),
        ),
      ],
    );
  }
}
