import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/PresntationLayer/screens/CharactersDetailsScreens.dart';
import 'package:bloc_provider/constants/Colors.dart';
import 'package:bloc_provider/constants/strings.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: ()=> Navigator.of(context).pushNamed(charactersDetailsScreens, arguments: character),
        child: GridTile(
            footer: Container(
                width: double.infinity,
                color: Colors.black26,
                alignment: Alignment.bottomCenter,
                child: Text(
                  character.name,
                  style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
            ),
            child: Hero(
              tag: character.id,
              child: Container(
              color: MyColors.myGrey,
              child: character.image.isNotEmpty ?
              FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/Animated/loading.gif',
                image: character.image,
                fit: BoxFit.cover,) :
              Image.asset('assets/images/images.png')
                    ),
            ),
        ),
      ),
    );
  }
}
