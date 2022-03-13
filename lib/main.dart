import 'package:flutter/material.dart';
import 'package:show_me_pokemon/pages/PesquisaPokemon.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const PesquisaPokemon(
        title: 'Pokedex',
      ),
    );
  }
}