import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  static String calculatePageId = 'calculatePageScreen';
  const CalculatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }
}

class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
      child: Column(
        children: <Widget>[
          TextField(
            onTap: () {
              //showSearch(context: context, delegate: Search());
              Search();
            },
          )
        ],
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  final places = [
    "Agra",
    "delhi",
    "hyedrabaad",
    "noida",
    "uttar pradesh",
    "Jammu",
    "kashmire",
    "nagaland",
    "assam",
    "kerela",
    "banglore",
    "Gujrat",
    "bihar"
  ];

  final recentPlaces = [
    "Jammu",
    "kashmire",
    "nagaland",
    "assam",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Perform action when someone click suggestion
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon , on the left
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // show some results based on selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Widgets to show when someone searches

    final suggestionList = query.isEmpty ? recentPlaces : places;

    return Container(
      width: 300,
      height: 300,
      child: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
                leading: Icon(Icons.assignment),
                title: Text(suggestionList[index]),
              )),
    );
  }
}
