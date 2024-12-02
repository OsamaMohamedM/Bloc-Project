
import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/DataLayer/repo/CharactersRepo.dart';
import 'package:bloc_provider/businessLayer/new_cupit/characters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersCubit extends Cubit<CharactersState>
{
  final CharactersRepository charactersRepository ;
 late List<Character> characters=[];
  CharactersCubit(this.charactersRepository): super(CharactersInitial());

  List<Character>getAllCharacters()
  {
    charactersRepository.FetchData().then((characters){
      print("characters  : ${characters.length}");
      this.characters = characters;
      emit(CharactersLoaded(characters: characters));
    });
    return this.characters;
  }
}