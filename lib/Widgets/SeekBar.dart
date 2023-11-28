import 'dart:math';

import 'package:flutter/material.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;

  const SeekBar({Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangedEnd})
      : super(key: key);


  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double?_dragvalue;

  String formatDuratime(Duration? duration) {
    if (duration == null) {
      return '--:--';
    } else {
      String minutes = duration.inMinutes.toString().padRight(2, "0");
      String seconds = duration.inSeconds.remainder(60).toString().padLeft(
          2, "0");
      return '$minutes:$seconds';
    }
  }

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatDuratime(position)),
            Text(formatDuratime(duration - position)),
          ],
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(trackHeight: 5,
                thumbShape: const RoundSliderThumbShape(
                  disabledThumbRadius: 15,
                  enabledThumbRadius: 15,
                ),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                activeTickMarkColor: Colors.green,
                thumbColor: Colors.black,
                overlayColor: Colors.orangeAccent),
            child: Slider(
              activeColor: Colors.orangeAccent,
              inactiveColor: Colors.grey.shade800,
              value: min(_dragvalue ?? position.inMilliseconds.toDouble(),
                  duration.inMilliseconds.toDouble()),
              max: duration.inMilliseconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _dragvalue = value;
                  //log("_dragvalue ")
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(
                    Duration(milliseconds: value.round()
                    ),
                  );
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangedEnd != null) {
                  widget.onChangedEnd!(
                    Duration(milliseconds: value.round(),
                    ),
                  );
                }
                _dragvalue = value;
              },
            )),
      ],
    );
  }
}
