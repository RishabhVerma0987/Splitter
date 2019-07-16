import 'package:flutter/material.dart';

class ImagePanel extends StatelessWidget {
  final String imageLoction;
  ImagePanel({@required this.imageLoction});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(imageLoction);
    Image image = Image(
      image: assetImage,
    );

    return Positioned(
      top: 40,
      child: Container(
        child: image,
        width: 200,
        height: 200,
      ),
    );
  }
}

class ImagePanelTwo extends StatelessWidget {
  final String imageLoction;
  ImagePanelTwo({@required this.imageLoction});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(imageLoction);
    Image image = Image(
      image: assetImage,
    );

    return Container(
      child: image,
      width: 30,
      height: 30,
    );
  }
}
