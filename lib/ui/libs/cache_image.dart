import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class CacheImage extends StatelessWidget {
  CacheImage({required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => ImageLoading(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
