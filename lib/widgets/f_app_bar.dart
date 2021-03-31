import 'package:flutter/material.dart';

Widget FAppBar(String title, BuildContext context) {
  final theme = Theme.of(context);
  return AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        title,
        style: theme.textTheme.headline5.copyWith(color: Colors.black),
      )
  );
}