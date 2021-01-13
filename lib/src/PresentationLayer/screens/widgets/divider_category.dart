import 'package:flutter/material.dart';

import '../../../constants.dart';

class DividerCategory extends StatelessWidget {
  final String title;

  const DividerCategory({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: kPrimaryColor,
          thickness: 2.0,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: kPrimaryColor,
          thickness: 2.0,
        ),
      ],
    );
  }
}
