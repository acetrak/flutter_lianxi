import 'package:flutter/material.dart';
import 'package:flutter1/components/Tabs.dart';
import 'package:flutter1/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform:  TargetPlatform.iOS,
      ),
      home: Tabs(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
