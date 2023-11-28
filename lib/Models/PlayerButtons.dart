import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayee/Models/Neumorphicbtn.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,  this.isPlaying=false,
  });

  final AudioPlayer audioPlayer;
  final bool? isPlaying ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return Neumorphism(
                size: 60,
                child: IconButton(
                    onPressed: audioPlayer.hasPrevious
                        ? audioPlayer.seekToPrevious
                        : null,
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.orange,
                      size: 35,
                    )),
              );
            }),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState =
                  (playerState! as PlayerState).processingState;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(),
                  width: 50.0,
                  height: 35.0,
                );
              } else if (!audioPlayer.playing) {
                return Neumorphism(size: 75,
                  child: IconButton(
                      onPressed:  audioPlayer.play,
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 45,
                        color: Colors.orange,
                      )),
                );
              } else if (processingState != ProcessingState.completed) {
                return Neumorphism(
                  size: 75,
                  child: IconButton(
                      onPressed: audioPlayer.pause,
                      icon: const Icon(
                        Icons.pause,
                        size: 45,
                        color: Colors.orange,
                      )),
                );
              } else {
                return IconButton(
                    onPressed: () => audioPlayer.seek(Duration.zero,
                        index: audioPlayer.effectiveIndices!.first),
                    icon: Icon(
                      Icons.replay,
                      color: Colors.orange,
                    ));
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return Neumorphism(
                size: 60,
                child: IconButton(
                    onPressed: audioPlayer.hasNext
                        ? audioPlayer.seekToNext
                        : null,
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.orange,
                      size: 35,
                    )),
              );
            }),

      ],
    );
  }
}

