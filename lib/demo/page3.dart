import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';

double getHeightPx(double height) => ScreenUtil.getInstance().getHeightPx(height);

double getWidthPx(double width) => ScreenUtil.getInstance().getWidthPx(width);

double getAdapterSize(double width) => ScreenUtil.getInstance().getAdapterSize(width);

double getSp(double fontSize) => ScreenUtil.getInstance().getSp(fontSize);

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///设计图尺寸
    setDesignWHD(375, 812, density: 1.0);

    return Scaffold(
      body: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('data$count'),
          RaisedButton(
            onPressed: () {
              setState(() {
                this.count++;
              });
            },
            child: Text('按钮'),
          )
        ],
      ),
    );
  }
}
