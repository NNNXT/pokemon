// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';

// Internal Modules
import 'package:pokemon/provider/pokemon.dart';
import 'package:pokemon/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
