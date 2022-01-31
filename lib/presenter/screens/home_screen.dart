import 'package:escribo_star_wars/core/themes/size_config.dart';
import 'package:escribo_star_wars/presenter/widgets/home_app_bar.dart';
import 'package:escribo_star_wars/presenter/widgets/list_item.dart';
import 'package:escribo_star_wars/presenter/widgets/menu_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return SafeArea(
        child: Scaffold(
      appBar: const HomeAppBar(),
      body: Container(
        height: SizeConfig.height,
        width: SizeConfig.width,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MenuButton(
                  text: 'Filmes',
                  isSelected: true,
                ),
                MenuButton(
                  text: 'Personagens',
                  isSelected: false,
                ),
                MenuButton(
                  text: 'Favoritos',
                  isSelected: false,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.height * 0.05,
            ),
            Expanded(
              child: ListView.builder(
                  //shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ListItem(text: 'Luke Skywalker', index: index);
                  }),
            ),
            SizedBox(
              height: SizeConfig.height * 0.05,
            ),
          ],
        ),
      ),
    ));
  }
}


// Container(
//                     width: double.infinity,
//                     height: SizeConfig.height * 0.15,
//                     margin: EdgeInsets.all(15.0),
//                     decoration: BoxDecoration(color: Color(0xFF282727)),
//                     alignment: Alignment.center,
//                     child: Text('Luke Skywalker'),
//                   );