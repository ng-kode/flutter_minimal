import 'package:flutter/material.dart';
import './components/index.dart';

class ScaffoldMRoute {
  final String title;
  final String routeName;
  final WidgetBuilder routeBuilder;
  final Icon routeIcon;

  ScaffoldMRoute(this.title, this.routeName, this.routeBuilder,
      {this.routeIcon});
}

final routes = <ScaffoldMRoute>[
  ScaffoldMRoute(
    'Bottom Action Sheet',
    '/mat-bottom-action-sheet',
    (context) => MatBottomActionSheet(),
  ),
  ScaffoldMRoute(
    'Bottom Nav Bar',
    '/mat-bottom/nav-bar',
    (context) => MatBottomNavBar(),
  ),
  ScaffoldMRoute(
    'Button',
    '/mat-button',
    (context) => MatButton(),
  ),
  ScaffoldMRoute(
    'Card',
    '/mat-card',
    (context) => MatCard(),
  ),
  ScaffoldMRoute(
    'Date And Time Picker',
    '/mat-data-and-time-picker',
    (context) => MatDateAndTimePicker(),
  ),
  ScaffoldMRoute(
    'Dialog',
    '/mat-dialog',
    (context) => MatDialog(),
  ),
  ScaffoldMRoute(
    'Expansion Panels',
    '/mat-expansion-panel',
    (context) => MatExpansionPanel(),
  ),
  ScaffoldMRoute(
    'Expansion Tiles',
    '/mat-expansion-tile',
    (context) => MatExpansionTile(),
  ),
  ScaffoldMRoute(
    'Floating Action Button',
    '/mat-floating-action-button',
    (context) => MatFloatingActionButton(),
  ),
  ScaffoldMRoute(
    'Form',
    '/mat-form',
    (context) => MatForm(),
  ),
  ScaffoldMRoute(
    'Grid',
    '/mat-grid',
    (context) => MatGrid(),
  ),
  ScaffoldMRoute(
    'List Tiles',
    '/mat-list-tile',
    (context) => MatListTile(),
  ),
  ScaffoldMRoute(
    'Popup Menu',
    '/mat-popup-menus',
    (context) => MatPopupMenus(),
  ),
  ScaffoldMRoute(
    'Refresh Indicator',
    '/mat-refresh-indicator',
    (context) => MatRefreshIndicator(),
  ),
  ScaffoldMRoute(
    'Reorderable List',
    '/mat-reorderable-list',
    (context) => MatReorderableList(),
  ),
  ScaffoldMRoute(
    'Search',
    '/mat-search-delegate',
    (context) => MatSearchDelegate(),
  ),
  ScaffoldMRoute(
    'Slider',
    '/mat-slider',
    (context) => MatSlider(),
  ),
  ScaffoldMRoute(
    'Snack Bar',
    '/mat-snack-bar',
    (context) => MatSnackBar(),
  ),
  ScaffoldMRoute(
    'Swipeable Tiles',
    '/mat-swipeable-tiles',
    (context) => MatSwipeableTile(),
  ),
  ScaffoldMRoute(
    'Tab Views',
    '/mat-tab-views',
    (context) => MatTabView(),
  ),
];
