import 'package:flutter/material.dart';

class Name with ChangeNotifier {
  String memberName;
  double amountOwes;

  Name({this.memberName, this.amountOwes});

  String get name {
    return memberName;
  }

  double get owedAmount {
    return amountOwes;
  }

  set setOwedAmount(double value) {
    amountOwes = value;
    notifyListeners();
  }

  set setName(String value) {
    memberName = value;
  }
}
