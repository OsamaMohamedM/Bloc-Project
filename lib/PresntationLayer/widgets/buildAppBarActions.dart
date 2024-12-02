import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';
class AppBarActionWidget {
  static List<Widget> buildAppBarActions({
    required BuildContext context,
    required bool isSearch,
    required VoidCallback startSearch,
  }) {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  static void startSearch({
    required BuildContext context,
    required VoidCallback stopSearch,
    required TextEditingController searchTextController,
    required ValueSetter<bool> updateSearchState,
  }) {
    searchTextController.clear();
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    updateSearchState(true);
  }

  static void stopSearch({
    required TextEditingController searchTextController,
    required ValueSetter<bool> updateSearchState,
  }) {
    searchTextController.clear();
    updateSearchState(false);
  }
}
