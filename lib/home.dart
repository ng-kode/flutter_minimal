import 'package:flutter/material.dart';
import './constants.dart';
import './routes.dart';

class Home extends StatefulWidget {
  final String title;

  Home(this.title);

  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSecondaryDrawer = false;

  void _onDrawerItemTapped(BuildContext context, String item) {
    Navigator.pop(context);
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$item tapped'),
    ));
  }

  Widget _buildDrawerHeader(BuildContext context, double height,
      {smallHeader = false}) {
    if (smallHeader) {
      return SizedBox(
        height: height,
        child: UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text('Friday'),
          accountEmail: Text('friday.today@outlook.com'),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        child: UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text('Friday'),
          accountEmail: Text('friday.today@outlook.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('$imageDir/thinking_face.png'),
          ),
          otherAccountsPictures: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage('$imageDir/joy_face.png'),
              ),
              onTap: () {
                _onDrawerItemTapped(context, 'Joy face');
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage('$imageDir/sunglasses_face.png'),
              ),
              onTap: () {
                _onDrawerItemTapped(context, 'Sunglasses face');
              },
            ),
          ],
          onDetailsPressed: () {
            setState(() {
              showSecondaryDrawer = !showSecondaryDrawer;
            });
          },
        ),
      );
    }
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    if (!showSecondaryDrawer) {
      return routes.map((ScaffoldMRoute route) {
        return ListTile(
          title: Text(route.title),
          onTap: () {
            Navigator.pushNamed(context, route.routeName);
          },
        );
      }).toList();
    } else {
      return [
        ListTile(
          title: Text('Settings'),
          leading: Icon(Icons.settings),
          onTap: () {
            _onDrawerItemTapped(context, 'Settings');
          },
        ),
        ListTile(
          title: Text('Sign Out'),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            _onDrawerItemTapped(context, 'Sign Out');
          },
        )
      ];
    }
  }

  Drawer _buildDrawer(BuildContext context) {
    final headerHeight = 200.0;
    final smallHeaderHeight = 116.0;
    final drawerHeader = _buildDrawerHeader(context, headerHeight);
    final drawerHeaderSmall =
        _buildDrawerHeader(context, smallHeaderHeight, smallHeader: true);
    final rest = _buildDrawerList(context);

    List<Widget> drawerItems = [];
    drawerItems.add(drawerHeader);
    drawerItems.addAll(rest);

    return Drawer(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: _PersistentHeader(
              drawerHeader,
              headerHeight,
              smallHeaderHeight,
              smallHeader: drawerHeaderSmall,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(rest),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Text(
          'Choose a component \nfrom menu to get started.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget header;
  final double nonShrinkHeaderHeight;
  final double smallestHeaderHeight;
  final Widget smallHeader;

  _PersistentHeader(
      this.header, this.nonShrinkHeaderHeight, this.smallestHeaderHeight,
      {this.smallHeader});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (this.smallHeader != null && shrinkOffset >= this.smallestHeaderHeight) {
      return this.smallHeader;
    }
    return header;
  }

  // TODO: implement maxExtent
  @override
  double get maxExtent => nonShrinkHeaderHeight;

  // TODO: implement minExtent
  @override
  double get minExtent => smallestHeaderHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
