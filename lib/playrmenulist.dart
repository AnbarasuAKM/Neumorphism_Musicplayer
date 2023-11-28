// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'Neumorphicbtn.dart';
//
// class PlayerMenuList extends StatefulWidget {
//   final int selectedIndex;
//
//   const PlayerMenuList({Key? key, required this.selectedIndex})
//       : super(key: key);
//
//   @override
//   State<PlayerMenuList> createState() => _PlayerMenuListState();
// }
//
// class _PlayerMenuListState extends State<PlayerMenuList> {
//   late int selectedIndex;
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     selectedIndex =widget.selectedIndex;
//     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {calculateScrollPosition(scrollController);});
//
//     super.initState();
//   }
// //   calculateScrollPosition(scrollController{
// //     int totalLength=ListData.musiclist.length;
// //     final macScroll=scrollController.of.position.maxScollExtent;
// //     scrollController.animateTo(macScroll/totalLength*selectedIndex,duration:Duration(miliseconds:10),curve:curves.easeIn);
// // })
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Color(0xffe6eefe),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Text(
//               "Anbu".toUpperCase(),
//               style: const TextStyle(
//                   fontSize: 15,
//                   fontFamily: "Tuesday",
//                   color: Color(0xff6c7a92)),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Neumorphism(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     size: 50,
//                     child: Icon(
//                       Icons.keyboard_backspace,
//                       size: 30,
//                       color: Colors.orangeAccent,
//                     ),
//                   ),
//                   Neumorphism(
//                     size: size * 0.5,
//                     padding: 07,
//                     Imageurl: ListData().musiclist[selectedIndex].imageUrl,
//                   ),
//                   Neumorphism(
//                     size: 50,
//                     child: Icon(
//                       ListData().musiclist[selectedIndex].isFav
//                           ? Icons.favorite
//                           : Icons.favorite_border,
//                       size: 25,
//                       color: Colors.orangeAccent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//                 child: ListView.builder(
//                     controller: ScrollController(),
//                     itemCount: ListData().musiclist.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex =index;
//                           });
//                         },
//                         child: Container(
//                           margin:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 15),
//                           decoration:selectedIndex==index? BoxDecoration(
//                             color: Color(0xffe6eefe),
//                             borderRadius: BorderRadius.circular(15),
//                           ):null,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     ListData().musiclist[index].name,
//                                     style: const TextStyle(
//                                         fontSize: 20,
//                                         fontFamily: "Tuesday",
//                                         color: Color(0xff6c7a92)),
//                                   ),
//                                   Text(ListData().musiclist[index].artist),
//                                 ],
//                               ),
//                               const Spacer(),
//                               selectedIndex == index
//                                   ? Neumorphism(
//                                 colors: [Colors.orangeAccent,Colors.orange],
//                                       size: 50,
//                                       child: Icon(
//                                         Icons.pause_rounded,
//                                         size: 25,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   : Neumorphism(
//                                       size: 50,
//                                       child: Icon(
//                                         Icons.play_arrow_outlined,
//                                         color: Colors.orangeAccent,
//                                       ),
//                                     ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Audio Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: (){
                      if(isPlaying)
                      {
                        player.pause();
                      }
                      else{
                        player.play(AssetSource('Munbe-Vaa-En-Vaa.mp3'));
                      }
                    },
                  ),
                ),
                SizedBox(width: 20,),
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon:const Icon(Icons.stop),
                    onPressed: (){
                      player.stop();
                    },
                  ),
                ),


              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     player.play(AssetSource('theme_01.mp3'));
            //   },
            //   child: const Text('Play Audio'),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       player.stop();
            //     },
            //     child: const Text('Stop Audio')),
            // ElevatedButton(
            //     onPressed: () {
            //       player.pause();
            //     },
            //     child: const Text('Pause ')),
            // ElevatedButton(
            //     onPressed: () {
            //       player.resume();
            //     },
            //     child: const Text('Resume')),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                player.seek(position);
                player.resume();
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position.inSeconds)),
                  Text(formatTime((duration - position).inSeconds)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}