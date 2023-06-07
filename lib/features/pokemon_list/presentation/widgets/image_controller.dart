import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constants.dart';

class ImageController extends StatefulWidget {
  final String imageURL;
  const ImageController({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  State<ImageController> createState() => _ImageControllerState();
}

class _ImageControllerState extends State<ImageController> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Image.network(
      "$imageBaseUrl${widget.imageURL}.png",
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

  @override
  bool get wantKeepAlive => true;
}
