import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayee/Screens/Homescreen.dart';
import 'package:musicplayee/Screens/SongScreen.dart';
import 'package:musicplayee/Screens/loginpage.dart';
import 'package:musicplayee/Screens/signinpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      getPages: [
        GetPage(name: '/', page: ()=>SignInPage()),
        GetPage(name: '/', page: ()=>HomeScreens()),
        GetPage(name: '/song', page: ()=>SongScreen()),
        GetPage(name: '/playlist', page: ()=>SongScreen()),
      ],
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final audioPlayer =AudioPlayer();
  Duration duration =Duration.zero;
  Duration position  =Duration.zero;
  bool isPlaying =false;

  var _controller;
  late int count;

  final List<Map<String, String>> intropg = [
    {
      "image":
          "https://img.freepik.com/premium-vector/sitting-girl-talking-headphones-vector-illustration_660230-211.jpg",
      "tittle": "LISTEN MUSIC",
      "Description": "Life sucks Music Heals"
    },
    {
      "image":
          "https://img.freepik.com/free-vector/man-enjoying-beautiful-music-indoors_23-2148538051.jpg",
      "tittle": "Put the song title",
      "Description": "Mood Swings"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {

      });

    });
    _controller = PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      count = value;
                    });
                  },
                  itemCount: intropg.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                intropg[index]["image"]!,
                              ),
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: count == 0 ? Colors.blue : Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: count == 1 ? Colors.blue : Colors.black,
                  ),
                ],
              ),
            ),
            Text(intropg[count]["tittle"]!,style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange
            ),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(intropg[count]["Description"]!,style: TextStyle(
                fontSize: 23,color: Colors.black,fontFamily: "Tuesday"
              ),),
            ),
            GestureDetector(
              onTap: (){
                Get.to(LoginPage());
                print("clicked");
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                  color: Colors.deepOrange),
                  child: Center(child: Text("Get Started",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
