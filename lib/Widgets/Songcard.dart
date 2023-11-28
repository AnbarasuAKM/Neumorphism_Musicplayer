import 'package:flutter/material.dart';
import 'package:musicplayee/Models/songModel.dart';
import 'package:get/get.dart';

class Songcard extends StatelessWidget {
  const Songcard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/song',arguments: song);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.5),
        margin: EdgeInsets.only(right: 10),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffE0E5EC),
                image: DecorationImage(
                    image: NetworkImage(song.Coverurl), fit: BoxFit.cover),
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
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        song.tittle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        song.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Icon(
                    Icons.play_circle,
                    color: Colors.orangeAccent,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
