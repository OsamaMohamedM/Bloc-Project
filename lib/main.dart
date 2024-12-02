import 'package:bloc_provider/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter =AppRouter();
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
      onGenerateRoute:appRouter.generateRoute ,

    );
  }
}



