import 'dart:ui';

import 'package:escribo_star_wars/core/themes/size_config.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function selectMenuItem;
  final Color selectedBorderColor;
  const MenuButton(
      {required this.text,
      required this.isSelected,
      required this.selectMenuItem,
      this.selectedBorderColor = Colors.blueAccent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
        minimumSize: Size(
          SizeConfig.width * 0.30,
          40.0,
        ),
        side: isSelected
            ? BorderSide(
                width: 2.0,
                color: selectedBorderColor,
              )
            : null,
      ),
      child: Text(text),
      onPressed: () {
        selectMenuItem(text);
      },
    );
  }
}
// BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
//               child: Container(
//                 width: double.infinity,
//                 height: 2.0,
//                 decoration: BoxDecoration(color: Colors.blue.withOpacity(0.0)),
//               ),
//             ),