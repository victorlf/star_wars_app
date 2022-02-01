import 'package:escribo_star_wars/constants/enums.dart';
import 'package:escribo_star_wars/data/models/favorite_model.dart';
import 'package:escribo_star_wars/presenter/widgets/favorite_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final String url;
  final DataType type;
  final bool isFavorite;
  final Function turnFavorite;
  final Function removeFavorite;
  const ListItem(
      {Key? key,
      required this.text,
      required this.url,
      required this.type,
      required this.isFavorite,
      required this.turnFavorite,
      required this.removeFavorite})
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
          trailing: IconButton(
            icon: Icon(
                isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
            onPressed: () {
              isFavorite
                  ? removeFavorite()
                  : turnFavorite(
                      FavoriteModel(
                          id: 0,
                          name: text,
                          url: url,
                          type: type == DataType.Movie ? 'movie' : 'character'),
                      type);
            },
          ),
        ),
      ),
    );
  }
}
