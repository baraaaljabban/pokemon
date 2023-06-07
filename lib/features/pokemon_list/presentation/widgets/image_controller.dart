import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constants.dart';

class ImageController extends StatelessWidget {
  final String imageURL;
  const ImageController({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$imageBaseUrl$imageURL.png",
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
