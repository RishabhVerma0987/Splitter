import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    Key key,
    @required this.imageLocation,
  }) : super(key: key);

  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(imageLocation);
    Image image = Image(
      image: assetImage,
    );
    return image;
  }
}
