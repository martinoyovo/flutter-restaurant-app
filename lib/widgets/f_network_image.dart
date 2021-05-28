import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/f_loader.dart';

Widget FNetworkImage({double height, double width, double radius, String imageUrl}) {
  Widget fLoader = FLoader(
      height: height,
      width: width,
      radius: radius
  );
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: CachedNetworkImage(
      width: double.infinity,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => fLoader,
      errorWidget: (context, url, error) => fLoader
    ),
  );
}