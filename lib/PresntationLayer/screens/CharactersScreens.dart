import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/PresntationLayer/widgets/OfflineWidget.dart';
import 'package:bloc_provider/PresntationLayer/widgets/buildAppBarActions.dart';
import 'package:bloc_provider/PresntationLayer/widgets/buildBlockWidget.dart';
import 'package:bloc_provider/PresntationLayer/widgets/buildSearchWidget.dart';
import 'package:bloc_provider/businessLayer/Services/SearchServices.dart';
import 'package:bloc_provider/businessLayer/new_cupit/characters_cubit.dart';
import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreens extends StatefulWidget {
  const CharactersScreens({super.key});

  @override
  State<CharactersScreens> createState() => _CharactersScreensState();
}


class _CharactersScreensState extends State<CharactersScreens> {
  List<Character> allCharacters = [];
  late List<Character> searchedCharacters;
  bool isSearch = false;
  final searchTextController = TextEditingController();

  getallCharacters() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  void initState() {
    getallCharacters();
    super.initState();
  }


  void _updateState(bool value) {
    setState(() {
      isSearch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myGrey,
        appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: isSearch ?
        AppBarTextWidget.buildSearchField(
        searchTextController: searchTextController,
        onChanged: (searchText)
    {
      setState(() {
        searchedCharacters =
            filterService.findSearchText(allCharacters, searchText);
      });
    }) :
    AppBarTextWidget.buildAppBarTitle(),
    actions:AppBarActionWidget.buildAppBarActions(
    context: context,
    isSearch: isSearch,
    startSearch: () {
    AppBarActionWidget.startSearch(
    context: context,
    stopSearch: () => AppBarActionWidget.stopSearch(
    searchTextController: searchTextController,
    updateSearchState: _updateState,
    ),
    searchTextController: searchTextController,
    updateSearchState: _updateState,
    );
    },
    ),
    ),
    body:OfflineBuilder(
    connectivityBuilder: (
    BuildContext context,
    List<ConnectivityResult> connectivity,
    Widget child,
    ){
    final bool connected = !connectivity.contains(ConnectivityResult.none);
    if(connected)
    {
    return searchTextController.text.isNotEmpty ? buildLoadedListWidget(searchedCharacters) : buildBlockWidget(allCharacters);
    }else
    {
      return const OfflineWidget();
    }
    },
      child:const Center(

        child: CircularProgressIndicator()
      ),
    )
    );

  }
}
