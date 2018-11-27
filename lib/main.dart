import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './routes.dart';
import './home.dart';

void main() => runApp(new ScaffoldM());

class ScaffoldM extends StatelessWidget {
  final home = Home('Flutter Minimal');

  @override
  Widget build(BuildContext context) {
    Firestore.instance
        .collection('trees')
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              print(doc.data);
            }));

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
