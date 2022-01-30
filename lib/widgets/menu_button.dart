import 'dart:ui';

import 'package:escribo_star_wars/core/themes/size_config.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const MenuButton({required this.text, required this.isSelected, Key? key})
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
            ? const BorderSide(
                width: 2.0,
                color: Colors.blueAccent,
              )
            : null,
      ),
      child: Text(text),
      onPressed: () {},
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