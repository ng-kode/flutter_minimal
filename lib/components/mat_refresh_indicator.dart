import 'package:flutter/material.dart';
import 'dart:async';

class MatRefreshIndicator extends StatefulWidget {
  @override
  MatRefreshIndicatorState createState() {
    return new MatRefreshIndicatorState();
  }
}

class MatRefreshIndicatorState extends State<MatRefreshIndicator> {
  int itemCount = 3;

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2, milliseconds: 5));
    setState(() {
      itemCount += 5;
    });
  }

  List<Widget> _getItems() {
    return List.generate(itemCount, (int index) {
      return ListTile(
        title: Text('Item ${index + 1}'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refresh Indicator'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: _getItems(),
        ),
      ),
    );
  }
}
