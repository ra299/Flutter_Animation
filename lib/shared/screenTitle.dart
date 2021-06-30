import "package:flutter/material.dart";

class ScreenTitle extends StatelessWidget {

  final String text;
  ScreenTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold
        )
      ),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      builder: (BuildContext, double _tween, Widget child){
        return Opacity(
          opacity: _tween,
          child: Padding(
            padding: EdgeInsets.only(top: _tween * 20),
            child: child
          ),
        );
      },
    );
  }
}
