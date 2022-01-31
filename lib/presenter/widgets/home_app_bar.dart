import 'package:escribo_star_wars/presenter/screens/website_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            margin: EdgeInsets.all(0.0),
            width: 120,
            height: 50,
            alignment: Alignment.center,
            color: Colors.black,
            child: const Text('Site Oficial',
                style: TextStyle(color: Colors.white, fontSize: 14.0)),
            //transform: Matrix4.skewX(-0.2),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WebSiteScreen(),
            ),
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'Customizar Avatar',
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, 0.0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
