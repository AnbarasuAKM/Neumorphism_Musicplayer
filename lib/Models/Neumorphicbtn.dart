import 'package:flutter/material.dart';

class Neumorphism extends StatelessWidget {
  const Neumorphism(
      {Key? key,
      required this.size,
      this.child,
      this.onPressed,
      this.blur =15,
      this.distance = 10,
      this.colors,
        this.Imageurl,
        this.padding})
      : super(key: key);
  final double size;
  final Widget? child;
  final VoidCallback? onPressed;
  final double blur;
  final double? distance;
  final List<Color>? colors;
  final String? Imageurl;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(padding??3),
          decoration: BoxDecoration(
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
          child:child,),
    );
  }
}

