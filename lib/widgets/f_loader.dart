import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget FLoader({double height, double width, double radius}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade200,
    highlightColor: Colors.white30,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(radius),)
    ),
  );
}