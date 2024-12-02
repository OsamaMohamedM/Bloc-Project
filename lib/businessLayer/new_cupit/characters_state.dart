import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CharactersState{}
class CharactersInitial extends CharactersState{
}

class CharactersLoaded extends CharactersState{
  final List<Character> characters;
  CharactersLoaded({required this.characters});
}