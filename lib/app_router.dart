import 'package:bloc_provider/DataLayer/Apis/Api.dart';
import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/DataLayer/repo/CharactersRepo.dart';
import 'package:bloc_provider/PresntationLayer/screens/CharactersDetailsScreens.dart';
import 'package:bloc_provider/PresntationLayer/screens/CharactersScreens.dart';
import 'package:bloc_provider/businessLayer/new_cupit/characters_cubit.dart';
import 'package:bloc_provider/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreens:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreens(),
          ),
        );
      case charactersDetailsScreens:
          final character =settings.arguments as Character;
        return MaterialPageRoute(
            builder: (context) => CharactersDetailsScreens(character:character));
    }
  }
}
