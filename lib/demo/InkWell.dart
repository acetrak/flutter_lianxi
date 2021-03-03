import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Rect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Text('无背景'),
        alignment: Alignment.center,
        width: 200,
        height: 44,
      ),
    );
  }
}

class Rect2 extends StatelessWidget {
  // 不能直接在Container上设置color属性
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Material(
            color: Colors.green,
            child: InkWell(
              onTap: () {},
              child: Container(
                child: Text('有背景'),
                alignment: Alignment.center,
                width: 200,
                height: 44,
              ),
            )));
  }
}

class Rect3 extends StatelessWidget {
  // 不能直接在Container上设置color属性
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Text('有背景'),
          alignment: Alignment.center,
          width: 200,
          height: 44,
        ),
        borderRadius: new BorderRadius.circular(25.0),
      ),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
      ),
    );
  }
}

class Rect4 extends StatelessWidget {
  // 不能直接在Container上设置color属性
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Material(
          color: Colors.deepOrange,
          child: InkWell(
            onTap: () {},
            child: Container(
              child: Text('有背景'),
              alignment: Alignment.center,
              width: 200,
              height: 44,
            ),
          )),
    );
  }
}

class Rect5 extends StatelessWidget {
  // 不能直接在Container上设置color属性
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Text('无背景'),
          alignment: Alignment.center,
          width: 200,
          height: 44,
        ),
      ),
    );
  }
}

class InkWellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('涟漪效果'),
      ),
      body: Container(
        color: Colors.orangeAccent, // 开启查看区别
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Rect(), Rect2(), Rect3(), Rect4(),Rect5()],
        ),
      ),
    );
  }
}
