import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/PresntationLayer/widgets/CharacterWidget.dart';
import 'package:bloc_provider/businessLayer/new_cupit/characters_cubit.dart';
import 'package:bloc_provider/businessLayer/new_cupit/characters_state.dart';
import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Widget buildBlockWidget(List<Character> allCharacters) {
  return BlocBuilder<CharactersCubit, CharactersState>(
    builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters.clear();
        for(int  i =0 ;i<state.characters.length ;i++)
        {
          allCharacters.add(state.characters[i]);
        }

        return buildLoadedListWidget(allCharacters);
      } else {
        return Center(child:CircularProgressIndicator());
      }
    },
  );
}

Widget buildLoadedListWidget(List<Character> allCharacters) {
  return SingleChildScrollView(
      child:Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(allCharacters),
          ],
        ),
      )
  );
}


Widget buildCharactersList(List<Character> allCharacters)
{
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2/3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allCharacters.length,
      itemBuilder: (context ,index)
      {
        return CharacterItem( character: allCharacters[index],);
      }
  );
}