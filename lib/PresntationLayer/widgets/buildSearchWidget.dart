import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';

class AppBarTextWidget{
  static Widget buildSearchField({required TextEditingController searchTextController,
      required Function(String) onChanged}) {
    return TextField(
        controller: searchTextController,
        cursorColor: MyColors.myGrey,
        decoration: const InputDecoration(
            hintText: 'Find a character...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
        style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
        onChanged:onChanged);
  }

  static Widget buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
 }