import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';

double getHeightPx(double height) => ScreenUtil.getInstance().getHeightPx(height);
class Ripple extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color color;

  Ripple({this.child, this.onTap,this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: child,
        highlightColor: Color(0xFF272D66),
        splashColor: Color(0xFF272D66),
      ),
    );
  }
}
