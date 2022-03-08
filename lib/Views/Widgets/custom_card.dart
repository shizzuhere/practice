// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Custom_Card extends StatelessWidget {
  const Custom_Card({
    Key key,
    @required this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            // leading: Icon(Icons.album, size: 45),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
