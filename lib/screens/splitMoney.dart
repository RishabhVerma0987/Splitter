import 'package:custom_clipper/components/homepage/circularAvatar.dart';
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
            resizeToAvoidBottomInset: false,
            body: Column(
              children: <Widget>[
                Container(
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                        children: <Widget>[ContactAvatar(), ContactAvatar()]),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 40),
                      child: Text(
                        'With you and ,',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(9),
                        child: Container(
                          width: 330,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9)),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 35),
                      child: Container(
                        width: 340,
                        height: 200,
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF1EBC3),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(9),
                                        topLeft: Radius.circular(9))),
                              ),
                              Container(color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                    showSearchResults
                        ? Padding(
                            padding: const EdgeInsets.only(top: 160, left: 30),
                            child: Material(
                              elevation: 4,
                              child: Container(
                                height: 300,
                                width: 350,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Card(
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
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 0,
                                    );
                                  },
                                ),
                              ),
                            ))
                        : Container(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: RaisedButton(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    onPressed: () {},
                    child: Container(
                      width: 90,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Split Equally',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   width: 200,
                      //   height: 160,
                      //   color: Colors.red,
                      // ),
                      Center(
                        child: Container(
                            width: 100.0,
                            height: 100.0,
                            child: new RawMaterialButton(
                              fillColor: Colors.blueGrey,
                              shape: new CircleBorder(),
                              elevation: 5,
                              child: Text('Go'),
                              onPressed: () {},
                            )),
                      )
                    ],
                  ),
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

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          CircluarAvatar(
            radius: 40,
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg'),
          ),
          Positioned(
            top: 50,
            left: 35,
            child: Container(
              width: 80,
              height: 35,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Center(child: Text('Mike')),
              ),
            ),
          ),
          Positioned(
            right: -12,
            top: -5,
            child: Icon(
              Icons.clear,
            ),
          )
        ],
      ),
    );
  }
}
