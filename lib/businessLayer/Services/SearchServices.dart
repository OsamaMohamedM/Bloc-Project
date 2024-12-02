import 'package:bloc_provider/DataLayer/Models/Characters.dart';

class filterService {
  static List<Character> findSearchText(List<Character>allCharacters , String searchText) {
     return  allCharacters.where(
            (character) => character.name.toLowerCase().startsWith(searchText))
        .toList();
  }
}
