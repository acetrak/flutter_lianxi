import 'package:flutter/material.dart';

class Not404 extends StatelessWidget {
  final String pathName;
  Not404({this.pathName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Container(
        child: Text('页面路径$pathName'),
      ),
    );
  }
}
