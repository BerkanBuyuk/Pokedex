import 'package:flutter/material.dart';
import 'package:pokedex/widgets/app_title.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: const PokemonList()),
        ],
      ),
    );
  }
}

