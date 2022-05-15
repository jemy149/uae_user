import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds:5),
    animationBehavior: AnimationBehavior.preserve,
    value: 1,
    vsync: this,

  )..repeat(reverse: true,);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds:4600), (){
      _controller.stop(canceled: true);
    });

    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        child:Image.asset('assets/images/Scroll Group 1.png',fit: BoxFit.contain,),
        padding:const EdgeInsetsDirectional.only(top:130.0,),
      ),
    );
  }
}
