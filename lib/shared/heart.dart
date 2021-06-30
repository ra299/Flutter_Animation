import "package:flutter/material.dart";

class Heart extends StatefulWidget {
  const Heart({Key key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController _controller;
  Animation _colorAnimation;
  Animation _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this
    );
    _colorAnimation = ColorTween(begin: Colors.yellow[700], end: Colors.red[700])
    .animate(_controller);

    // ----> use it for animationListener
    // _controller.addListener(() {
    //  
    // });

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState((){
          isFav = true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return IconButton(
            icon: Icon(Icons.favorite, color: _colorAnimation.value, size: 30),
            onPressed: (){
              isFav ? _controller.reverse() : _controller.forward();
            },
        );
      }
    );
  }
}
