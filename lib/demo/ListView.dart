import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  List<Widget> getData() {
    return <Widget>[
      ListTile(
          leading: ClipOval(
            child:
                Image.asset('images/2178ec835c7198af83d6b541bb2b9849_qhd.png'),
          ),
          title: Text('dio: ^3.0.10'),
          subtitle: Text(
              'A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.')),
      ListTile(
          leading: Icon(Icons.arrow_circle_down),
          title: Text('dio: ^3.0.10'),
          subtitle: Text(
              'A powerful Http client for Dart, which supports Interceptors,')),
      ListTile(
          trailing: Icon(Icons.emoji_events_outlined),
          title: Text('dio: ^3.0.10'),
          subtitle: Text(
              ' Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.')),
      ListTile(
          title: Text('dio: ^3.0.10'),
          subtitle: Text(
              'A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text('dio: ^3.0.10'),
            subtitle: Text(
                'A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.'));
      },
    ));
  }
}
