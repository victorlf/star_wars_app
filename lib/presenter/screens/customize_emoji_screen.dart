import 'package:escribo_star_wars/presenter/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class CustomizeEmojiScreen extends StatelessWidget {
  const CustomizeEmojiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: FluttermojiCircleAvatar(
                radius: 100,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
              child: FluttermojiCustomizer(
                //scaffoldHeight: 400,
                showSaveWidget: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
