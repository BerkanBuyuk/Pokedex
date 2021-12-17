import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/Pokemon_Model.dart';
import 'package:pokedex/services/Pokedex_API.dart';
import 'package:pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<PokemonModel> _myList = snapshot.data!;

          return GridView.builder(
              itemCount: _myList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: UIHelper.getAppCrossAxisCount().toInt()),
              itemBuilder: (context, index) => PokeListItem(pokemon: _myList[index]),
          );
        }else if (snapshot.hasError){
          return const Center(child: Text("Hata"),);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}