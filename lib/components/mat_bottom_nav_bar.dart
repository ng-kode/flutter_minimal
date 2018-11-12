import 'package:flutter/material.dart';

class MatBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MatBottomNavBarState();
  }
}

class MatBottomNavBarState extends State<MatBottomNavBar> {
  int currentIndex = 0;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    this.pages = [
      buildPage('Home'),
      buildPage('Search'),
      buildPage('Create'),
      buildPage('Favourite'),
      buildPage('Profile'),
    ];
  }

  buildPage(String name) {
    return Center(child: Text('$name'));
  }

  buildItem(IconData iconData, String iconName, BuildContext context) {
    return BottomNavigationBarItem(
      title: Text(
        '$iconName',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      icon: Icon(
        iconData,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Bar'),
      ),
      body: this.pages[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            this.currentIndex = val;
          });
        },
        items: [
          buildItem(Icons.home, 'Home', context),
          buildItem(Icons.search, 'Search', context),
          buildItem(Icons.add_box, 'Create', context),
          buildItem(Icons.favorite_border, 'Favourite', context),
          buildItem(Icons.account_box, 'Profile', context),
        ],
      ),
    );
  }
}
