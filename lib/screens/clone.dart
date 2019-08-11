import 'package:custom_clipper/state/splitBill.dart';
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
  var amountSplitterSetter = ['Split equally', 'unequally'];
  var currentAmountSplitterSetter = 'Split equally';
  var members = [
    Name(memberName: 'kusha', amountOwes: 0.0),
    Name(memberName: 'Sanchit', amountOwes: 0.0),
    Name(memberName: 'Mansi', amountOwes: 0.0),
    Name(memberName: 'Rijul', amountOwes: 0.0),
  ];
  var total = 0.0;
  double amount = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 10, left: 5, right: 5),
                    child: Container(
                      width: 80,
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        elevation: 5.0,
                        child: Center(child: Text(members[index].name)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Amount",
                  hintStyle: TextStyle(fontSize: 30),
                ),
                onChanged: (value) {
                  setState(() {
                    amount = double.parse(value);
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    calculate();
                  },
                  color: Colors.cyan,
                  child: Text("Split"),
                ),
                buildDropdownButton()
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Total:',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
            Text(total.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100)),
            RaisedButton(
              onPressed: () {
                for (var i = 0; i <= members.length; i++) {
                  print(members[i].name + ' ' + members[i].name.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void calculate() {
    if (currentAmountSplitterSetter == 'Split equally') {
      setState(() {
        total = amount / members.length;
      });
      for (var i = 0; i <= members.length; i++) {
        members[i].setOwedAmount = total;
      }
    } else {
      unequalsplit();
    }
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      items: amountSplitterSetter.map((String dropDownElement) {
        return DropdownMenuItem<String>(
          value: dropDownElement,
          child: Text(dropDownElement),
        );
      }).toList(),
      onChanged: (String newValueSelected) {
        setState(() {
          currentAmountSplitterSetter = newValueSelected;
        });
      },
      value: currentAmountSplitterSetter,
    );
  }

  Future unequalsplit() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Amount left:' + ' ' + total.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            )),
            content: Container(
              width: 300,
              height: 300,
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        members[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 20),
                      ),
                      Container(
                          width: 55,
                          child: TextField(
                            keyboardType: TextInputType.number,
                          )),
                    ],
                  ));
                },
              ),
            ),
          );
        });
  }
}
