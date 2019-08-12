import 'package:flutter/material.dart';

class SplitMoney extends StatefulWidget {
  static String splitMoneyId = 'splitMoney_screen';
  SplitMoney({Key key}) : super(key: key);

  _SplitMoneyState createState() => _SplitMoneyState();
}

class _SplitMoneyState extends State<SplitMoney> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(20, (i) => "Item $i");
  bool showSearchResults = false;
  var items = List<String>();
  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(showSearchResults);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          // Dismiss soft keyboard on tap anywhere on the screen
          FocusScope.of(context).requestFocus(new FocusNode());
          editingController.clear();
          disableSearchResult();
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 40),
                      child: Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 330,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 8),
                            child: TextField(
                              onChanged: (value) {
                                filterSearchResults(capitalize(value));
                                disableSearchResult();
                              },
                              controller: editingController,
                              decoration: InputDecoration(
                                  hintText: 'Search', border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    showSearchResults
                        ? Padding(
                            padding: const EdgeInsets.only(top: 155, left: 40),
                            child: Container(
                              height: 230,
                              width: 330,
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text('${items[index]}'),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 5,
                                  );
                                },
                              ),
                            ))
                        : Container()
                  ],
                )
              ],
            )),
      ),
    );
  }

  void disableSearchResult() {
    if (editingController.text.isEmpty) {
      setState(() {
        showSearchResults = false;
      });
    } else {
      setState(() {
        showSearchResults = true;
      });
    }
  }

  //filter results
  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  //captilize first letter of string
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
