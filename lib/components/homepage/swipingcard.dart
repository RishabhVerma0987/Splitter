import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'cardContainer.dart';
import '../../state/data.dart';

class SwipingCard extends StatelessWidget {
  //if isOwe = true then we take fist swiping card stack i.e the amount That I owe
  final bool isOwe;

  SwipingCard({@required this.isOwe});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CardContainer(
          colorForGradient: isOwe
              ? amountYouOweToYourFriendsCards[index].getColor()
              : amountMyFriendsOwedToMeCards[index].getColor(),
          name: isOwe
              ? amountYouOweToYourFriendsCards[index].getName()
              : amountMyFriendsOwedToMeCards[index].getName(),
          amount: isOwe
              ? amountYouOweToYourFriendsCards[index].getAmount()
              : amountMyFriendsOwedToMeCards[index].getAmount(),
          image: isOwe
              ? amountYouOweToYourFriendsCards[index].getImage()
              : amountMyFriendsOwedToMeCards[index].getImage(),
        );
      },
      itemCount: isOwe
          ? amountYouOweToYourFriendsCards.length
          : amountMyFriendsOwedToMeCards.length,
      itemWidth: 330,
      itemHeight: 150,
      layout: SwiperLayout.STACK,
    ));
  }
}
