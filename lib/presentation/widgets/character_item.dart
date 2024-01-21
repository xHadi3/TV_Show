import 'package:flutter/material.dart';
import 'package:test_s/constants/my_colors.dart';

import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Results character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: MyColors.myGrey,
          child: character.image!.isEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.jpeg'),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.name},",
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
