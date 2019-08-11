import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/homepage/colorGradientForSwipingCards.dart';

class Data {
  double amount;
  String name;
  ImageProvider avatarImage;
  List<Color> color;
  Data({this.amount, this.avatarImage, this.name, this.color});

  getAmount() => amount;
  getName() => name;
  getImage() => avatarImage;
  getColor() => color;
}

List<Data> amountYouOweToYourFriendsCards = [
  Data(
      amount: 45.7,
      name: 'Kushagra',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
  Data(
      amount: 89.7,
      name: 'Mike',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg')),
  Data(
      amount: 124.0,
      name: 'Alex',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/1200px-Pierre-Person.jpg')),
  Data(
      amount: 245.7,
      name: 'Alesa',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://www.midlandsderm.com/wp-content/uploads/2019/04/Rachel-R.-Person-760x760.jpg')),
];

List<Data> amountMyFriendsOwedToMeCards = [
  Data(
      amount: 42.7,
      name: 'Rachel',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
  Data(
      amount: 145.8,
      name: 'Benjiman',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://images.unsplash.com/photo-1553907725-c3d2e2ccc00e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')),
  Data(
      amount: 25.7,
      name: 'Mark',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://www.biography.com/.image/ar_8:10%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_620/MTY0NTcwODc2ODY2NDcxNjg5/el_04172019_ct_0139.jpg')),
  Data(
      amount: 45.1,
      name: 'Zyan',
      color: pickRandomColorList(),
      avatarImage: NetworkImage(
          'https://i2.wp.com/metro.co.uk/wp-content/uploads/2019/03/GettyImages-911518004.jpg?quality=90&strip=all&zoom=1&resize=644%2C429&ssl=1')),
];
