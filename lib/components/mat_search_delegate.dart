import 'package:flutter/material.dart';

class _SearchDelegate extends SearchDelegate {
  final _data = ['Apple', 'Banana', 'Cherry', 'Mango', 'Melon'];
  final _data2 = {
    'Apple': ['Apple 1', 'Apple 2', 'Apple 3'],
    'Banana': ['Banana 1', 'Banana 2', 'Banana 3'],
    'Cherry': ['Cherry 1', 'Cherry 2', 'Cherry 3'],
  };
  final _history = ['Cherry', 'Orange', 'Pineapple'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
              icon: Icon(Icons.keyboard_voice),
              onPressed: () {
                query = 'TODO: implement voice input';
              },
            )
          : IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                query = '';
              },
            )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _data2[query];
    return results == null
        ? ListView(
            children: <Widget>[
              ListTile(
                title: Text('Not Found'),
              )
            ],
          )
        : ListView(
            children: results
                .map((r) => ListTile(
                      title: Text(r),
                      onTap: () {
                        close(context, r);
                      },
                    ))
                .toList(),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _history
        : _data.where((s) => s.toLowerCase().startsWith(query));
    return ListView(
      children: suggestions
          .map((s) => ListTile(
                leading: _history.contains(query) ? Icon(Icons.history) : null,
                title: Text(s),
                onTap: () {
                  query = s;
                  showResults(context);
                },
              ))
          .toList(),
    );
  }
}

class MatSearchDelegate extends StatefulWidget {
  @override
  MatSearchDelegateState createState() {
    return new MatSearchDelegateState();
  }
}

class MatSearchDelegateState extends State<MatSearchDelegate> {
  dynamic result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final pickedSearchResult = await showSearch(
                context: context,
                delegate: _SearchDelegate(),
              );

              setState(() {
                result = pickedSearchResult;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Text('Search Result: $result'),
      ),
    );
  }
}
