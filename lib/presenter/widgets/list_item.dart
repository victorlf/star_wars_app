import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final int index;
  const ListItem({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        color: Color(0xFF282727),
        child: ListTile(
          title: Text(
            text,
            textAlign: TextAlign.center,
          ),
          trailing: Icon(index % 2 == 0
              ? CupertinoIcons.heart
              : CupertinoIcons.heart_fill),
        ),
      ),
    );
  }
}
