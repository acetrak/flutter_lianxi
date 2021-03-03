import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {

  final arguments;

  FormPage({this.arguments});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
        // elevation: 12,
      ),
      body: Text('yyyyyyyy${widget.arguments}'),
    );
  }
}
