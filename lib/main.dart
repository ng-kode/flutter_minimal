import 'package:flutter/material.dart';

import './routes.dart';
import './home.dart';

void main() => runApp(new ScaffoldM());

class ScaffoldM extends StatelessWidget {
  final home = Home('Flutter Minimal');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Minimal',
      home: home,
      routes: Map<String, WidgetBuilder>.fromIterable(
        routes,
        key: (route) => route.routeName,
        value: (route) => route.routeBuilder,
      ),
    );
  }
}
