import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'colorGradientForSwipingCards.dart';
import 'cardContainer.dart';

class SwipingCard extends StatelessWidget {
  const SwipingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CardContainer(
          colorForGradient: colorGradientForSwipingCards[index],
        );
      },
      itemCount: colorGradientForSwipingCards.length,
      itemWidth: 310,
      itemHeight: 130,
      layout: SwiperLayout.STACK,
    ));
  }
}
