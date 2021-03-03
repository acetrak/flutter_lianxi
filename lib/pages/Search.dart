import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter1/common/flutter_collapse.dart';

import 'package:flutter1/components/Accordion.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String expanded = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        // elevation: 12,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Accordion(
            accordionSummary: AccordionSummary(
              child: Container(
                height: 60,
                child: Text(
                  '标题',
                  style: TextStyle(color: Colors.white),
                ),
                alignment: Alignment.centerLeft,
              ),
              expandIcon: const Icon(
                Icons.expand_more,
                size: 24,
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              color: Colors.blue,
            ),
            accordionDetails: Container(
              height: 300,
              width: double.infinity,
              color: Colors.orangeAccent,
              child: Text('我的内容'),
            ),
            expanded: expanded == 'panel1',
            onChange: (expanded) {
              print(expanded);
              setState(() {
                this.expanded == 'panel1' ? this.expanded = '' : this.expanded = 'panel1';
              });
            },
          ),
          Accordion(
            accordionSummary: AccordionSummary(
              child: Container(
                height: 60,
                width: 120,
                child: Text(
                  '标题',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
              ),
              color: Colors.deepPurpleAccent,
              expandIcon: const Icon(
                Icons.expand_more,
                size: 24,
                color: Colors.white,
              ),
            ),
            accordionDetails: Container(
              height: 200,
              width: double.infinity,
              color: Colors.orangeAccent,
              child: Text('我的内容'),
            ),
            expanded: expanded=='panel2',
            onChange: (expanded) {
              setState(() {
                this.expanded=='panel2'? this.expanded = '':this.expanded = 'panel2';
              });
            },
          ),
          Text('sdsdsd')
        ],
      ),
    );
  }
}
