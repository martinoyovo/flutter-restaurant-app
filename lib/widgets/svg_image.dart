import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget SvgImage (String assetName) {
  return SvgPicture.asset(
    assetName,
  );
}