import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class FClass {
  getFTheme(BuildContext context) {
    return Theme.of(context);
  }
  getFSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  getFPosition(BuildContext context) {
    return Provider.of<Position>(context);
  }
}