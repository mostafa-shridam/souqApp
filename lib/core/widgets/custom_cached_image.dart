import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        width: 80,
        height: 140,
        alignment: Alignment.center,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
