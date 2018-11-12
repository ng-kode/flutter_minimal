import 'package:flutter/material.dart';

class MatExpansionPanel extends StatefulWidget {
  @override
  MatExpansionPanelState createState() {
    return new MatExpansionPanelState();
  }
}

class Item {
  bool isExpanded;
  String header;
  IconData icon;
  Item(this.isExpanded, this.header, this.icon);

  Widget headerBuilder(BuildContext context, bool isExpanded) {
    return ListTile(
      leading: Icon(icon),
      title: Text(header),
    );
  }

  Widget build() {
    return Container(
      height: 100.0,
      child: Center(
        child: Text('Hi'),
      ),
    );
  }
}

class MatExpansionPanelState extends State<MatExpansionPanel> {
  List<Item> _items = List.generate(3, (int index) {
    return Item(false, 'Header $index', Icons.account_circle);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expansion Panel'),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded = !isExpanded;
              });
            },
            children: _items.map((Item item) {
              return ExpansionPanel(
                isExpanded: item.isExpanded,
                headerBuilder: item.headerBuilder,
                body: item.build(),
              );
            }).toList(),
          ),
        ));
  }
}
