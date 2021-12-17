import 'package:flutter/material.dart';
import 'package:pokedex/model/Pokemon_Model.dart';
import 'package:pokedex/services/Pokedex_API.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

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

          return ListView.builder(
            itemCount: _myList.length,
            itemBuilder: (context, index) {
              var currentPokemon = _myList[index];
              return ListTile(
                title: Text(currentPokemon.name.toString(),),
              );
            },
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
