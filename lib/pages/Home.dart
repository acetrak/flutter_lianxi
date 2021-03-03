import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter1/pages/Search.dart';

double getHeightPx(double height) => ScreenUtil.getInstance().getHeightPx(height);

double getWidthPx(double width) => ScreenUtil.getInstance().getWidthPx(width);

double getAdapterSize(double width) => ScreenUtil.getInstance().getAdapterSize(width);

double getSp(double fontSize) => ScreenUtil.getInstance().getSp(fontSize);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///设计图尺寸
    setDesignWHD(375, 812, density: 1.0);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search()));
            },
            child: Text('跳转到搜索页11'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form',arguments: 1);
            },
            child: Text('跳转到表单页'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lianxi01');
            },
            child: Text('跳转到lianxi01'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lianxi02');
            },
            child: Text('跳转到lianxi02'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lianxi03');
            },
            child: Text('跳转到lianxi03'),
          )
        ],
      ),
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
