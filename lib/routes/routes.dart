import 'package:flutter/cupertino.dart';
import 'package:flutter1/pages/Form.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/screens/Not404.dart';
import 'package:flutter1/screens/lianxi01.dart';
import 'package:flutter1/screens/lianxi02.dart';
import 'package:flutter1/screens/lianxi03.dart';

final Map _routes = new Map<String, Widget Function(BuildContext)>.from({
  '/form': (context, {arguments}) => FormPage(arguments: arguments),
  '/lianxi01': (context ) => Lianxi01(),
  '/lianxi02': (context ) => Lianxi02(),
  '/lianxi03': (context ) => Lianxi03(),
});






final Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;

  final Function pageContentBuilder = _routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else {
    final Route route = MaterialPageRoute(builder: (context) => Not404(pathName: name));
    return route;
  }
};
