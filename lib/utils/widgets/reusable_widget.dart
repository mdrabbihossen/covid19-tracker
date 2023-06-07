import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  final String title;
  final String trailing;

  const Reusable({
    Key? key,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Text(trailing),
        ),
        const Divider(),
      ],
    );
  }
}
