import 'package:flutter/material.dart';
import 'package:flutter1/pages/Home.dart';
import 'package:flutter1/demo/page1.dart';
import 'package:flutter1/demo/page2.dart';
import 'package:flutter1/demo/InkWell.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          Page1(),
          Page2(),
          InkWellPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts_outlined), label: '通讯录'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}
