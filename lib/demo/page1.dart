import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:animations/animations.dart';

import '../components/Ripple.dart';
import '../components/NoRippleOverscroll.dart';
import '../demo_data/list.dart';

double getHeightPx(double height) => ScreenUtil.getInstance().getHeightPx(height);

double getWidthPx(double width) => ScreenUtil.getInstance().getWidthPx(width);

double getAdapterSize(double width) => ScreenUtil.getInstance().getAdapterSize(width);

double getSp(double fontSize) => ScreenUtil.getInstance().getSp(fontSize);

class Tag extends StatelessWidget {
  final int status;
  final Map statusMap = const {
    1: {'text': '正常', 'color': Color(0xFF49AA8D)},
    2: {'text': '未完成', 'color': Color(0xFFD65656)},
    3: {'text': '待验证', 'color': Color(0xFFEFA52E)},
  };

  Tag({@required this.status});

  getVal({String type}) {
    if (statusMap.containsKey(status)) {
      return statusMap[status][type];
    }

    if (type == 'text') return '未知-$status';
    if (type == 'color') return Color(0xFFCCCCCC);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getWidthPx(22)),
      child: Text(
        getVal(type: 'text'),
        style: TextStyle(color: Colors.white, fontSize: getSp(8.0)),
      ),
      width: getWidthPx(60),
      height: getHeightPx(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(getHeightPx(4.0))),
        color: getVal(type: 'color'),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String icon, name, value;

  const DetailItem({Key key, this.icon, this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: getHeightPx(10.0), bottom: getHeightPx(10.0), left: getHeightPx(24.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: getHeightPx(4.0), right: getWidthPx(10.0)),
              child: Image.asset(
                icon,
                width: getWidthPx(16.0),
                height: getHeightPx(16.0),
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: getHeightPx(6)),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: getSp(12.0), color: Color(0xFF8383D5)),
                  ),
                ),
                Text(value, style: TextStyle(fontSize: getSp(16.0), color: Color(0xFFFFFFFF))),
              ],
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: getHeightPx(18.0), top: getHeightPx(18.0)),
                    child: Center(
                      child: Text(
                        '存入记录详情',
                        style: TextStyle(fontSize: getSp(18.0), color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xFF23274E),
                    height: 1,
                    width: double.infinity,
                  ),
                  DetailItem(icon: 'images/time@2x.png', name: '时间', value: '2021-01-12 10:11:54'),
                  DetailItem(icon: 'images/total@2x.png', name: '存入总数', value: '34234.5'),
                  DetailItem(icon: 'images/add-on@2x.png', name: '预计补助', value: '2343.56'),
                  DetailItem(icon: 'images/commission@2x.png', name: '津贴释放', value: '2324.456'),
                  DetailItem(icon: 'images/activities@2x.png', name: '活动释放', value: '0'),
                  DetailItem(icon: 'images/status@2x.png', name: '状况', value: '完成'),
                ],
              )),
              Container(
                width: getWidthPx(200.0),
                height: getHeightPx(48.0),
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(bottom: getHeightPx(25.0)),
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                    Color(0xFFF0C987),
                    Color(0xFF8B6F45),
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(getHeightPx(24.0))),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: Text(
                        '确定',
                        style: TextStyle(color: Colors.white, fontSize: getSp(18.0)),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          width: getWidthPx(279.0),
          height: getHeightPx(580.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(getHeightPx(15.0))),
            color: Color(0xFF31376F),
          ),
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String date;
  final String name;
  final int status;
  final bool isFirst;
  final bool isLast;

  ItemCard({Key key, this.date, this.name, this.status, this.isFirst = false, this.isLast = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleTop() {
      showModal(
        context: context,
        configuration: FadeScaleTransitionConfiguration(
          //阴影背景颜色
          barrierColor: Colors.black54,
          //打开新的Widget 的时间
          transitionDuration: Duration(milliseconds: 500),
          //关闭新的Widget 的时间
          reverseTransitionDuration: Duration(milliseconds: 400),
        ),
        builder: (BuildContext context) {
          //显示的Widget
          return DetailCard();
        },
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(getHeightPx(isLast ? 15 : 0)), bottomRight: Radius.circular(getHeightPx(isLast ? 15 : 0))),
      child: Ripple(
        color: Color(0xFF31376F),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: getHeightPx(89.5),
          decoration: BoxDecoration(
            border: isLast ? null : Border(bottom: BorderSide(color: Color(0xFF23274E), width: 1, style: BorderStyle.solid)),
          ),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: getHeightPx(14.0)),
                        child: Text(
                          date,
                          style: TextStyle(color: Color(0xFF8F8FB2), fontSize: getSp(12.0)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: getSp(16.0)),
                          ),
                          Tag(
                            status: status,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '查看',
                      style: TextStyle(fontSize: getSp(14.0), color: Color(0xFF8383D5)),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      color: Color(0xFF8383D5),
                    )
                  ],
                )
              ],
            ),
            padding: EdgeInsets.fromLTRB(getWidthPx(18.0), 0, getWidthPx(18.0), 0),
          ),
        ),
        onTap: handleTop,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///设计图尺寸
    setDesignWHD(375, 812, density: 1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('布局练习'),
        backgroundColor: Color(0xFF20203C),
      ),
      body: Container(
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.fromLTRB(0, getHeightPx(30.0), 0, getHeightPx(30.0)),
            width: getWidthPx(302.0),
            child: NoRippleOverscroll(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index];
                  var isFirst = index == 0;
                  var isLast = index == list.length - 1;

                  return ItemCard(
                    date: item['date'],
                    name: item['name'],
                    status: item['status'],
                    isFirst: isFirst,
                    isLast: isLast,
                  );
                },
              ),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(getHeightPx(15.0)))),
          ),
          width: getWidthPx(375.0),
          height: getHeightPx(812.0),
          alignment: Alignment.center,
          color: Color(0xFF20203C)),
    );
  }
}
