import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';

double getHeightPx(double height) => ScreenUtil.getInstance().getHeightPx(height);

double getWidthPx(double width) => ScreenUtil.getInstance().getWidthPx(width);

double getAdapterSize(double width) => ScreenUtil.getInstance().getAdapterSize(width);

double getSp(double fontSize) => ScreenUtil.getInstance().getSp(fontSize);

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///设计图尺寸
    setDesignWHD(375, 812, density: 1.0);

    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/capital-income-bg@2x.png',
                  width: getWidthPx(186.0),
                  height: getHeightPx(160.0),
                ),
                Container(
                  width: getWidthPx(186.0),
                  height: getHeightPx(160.0),
                  // color: Colors.cyanAccent,
                  padding: EdgeInsets.only(top: getAdapterSize(30.0),left: getAdapterSize(40.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '本金总收益',
                        style: TextStyle(color: Colors.white, fontSize: getSp(14.0)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'images/capital-income-bg@2x.png',
                  width: getWidthPx(186.0),
                  height: getHeightPx(160.0),
                ),
                Container(
                  width: getWidthPx(186.0),
                  height: getHeightPx(160.0),
                  // color: Colors.cyanAccent,
                  padding: EdgeInsets.only(top: getAdapterSize(30.0),left: getAdapterSize(40.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '本金总收益',
                        style: TextStyle(color: Colors.white, fontSize: getSp(14.0)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
