import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final String text;
  final String type;
  const FavoriteItem({Key? key, required this.text, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF282727),
          border: Border.all(
            width: 1.0,
            color: type == 'character' ? Colors.greenAccent : Colors.redAccent,
          ),
        ),
        child: ListTile(
          title: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
