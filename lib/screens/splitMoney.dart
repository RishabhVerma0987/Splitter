import 'dart:typed_data';

import 'package:custom_clipper/components/homepage/circularAvatar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class SplitMoney extends StatefulWidget {
  static String splitMoneyId = 'splitMoney_screen';
  SplitMoney({Key key}) : super(key: key);

  _SplitMoneyState createState() => _SplitMoneyState();
}

class _SplitMoneyState extends State<SplitMoney> {
  TextEditingController editingController = TextEditingController();

  List<Data> duplicateItems = List<Data>();
  bool showSearchResults = false;

  List<Data> items = List<Data>();
  @override
  void initState() {
    askForContactAcessPermission();
    getAllContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return CircleAvatar();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      child: Text(
                        'With you and ,',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 40, right: 40),
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
                            padding: const EdgeInsets.only(top: 100, left: 30),
                            child: Material(
                              elevation: 4,
                              child: Container(
                                height: 250,
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
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${items[index].displayName}',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  //FIXME: add phone numbers below names
                                                  // Text('${items[index].phone}',
                                                  //     style: TextStyle(
                                                  //         fontSize: 12,
                                                  //         fontWeight:
                                                  //             FontWeight.w200))
                                                ],
                                              ),
                                            )),
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

  void askForContactAcessPermission() async {
    //TODO: has to handle all the cases , for eg - what if the permission to unKnown
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission.value == 2) {
      //means permission is granted
      print('permission given');
    } else {
      print('denied');
    }
  }

  getAllContact() async {
    List<Data> dataList = List<Data>();

    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);

    for (var i in contacts) {
      dataList.add(Data(displayName: i.displayName, phone: i.phones.toList()));
    }
    print(dataList[2].displayName);
    setState(() {
      duplicateItems.addAll(dataList);
    });
    setState(() {
      items.addAll(duplicateItems);
    });
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

  void filterSearchResults(String query) {
    List<Data> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Data> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.displayName.contains(query)) {
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
  final String displayName;
  ContactAvatar({this.displayName});

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
                child: Center(child: Text(displayName)),
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

class Data {
  String displayName;
  List phone;
  Data({this.displayName, this.phone});
}
