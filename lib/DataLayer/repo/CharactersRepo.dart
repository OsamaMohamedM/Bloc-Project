import 'package:bloc_provider/DataLayer/Apis/Api.dart';
import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:flutter/material.dart';

class CharactersRepository{

 final  CharactersApi charactersApi ;

 CharactersRepository(this.charactersApi);

 Future<List<Character>>FetchData()async{
   final characters  =await charactersApi.getAllCharacters();
   print("============APi Call : ${characters.length}=====");
   return characters.map((character) => Character.fromJson(character)).toList();
 }
}