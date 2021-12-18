import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/Pokemon_Model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_and_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(iconSize: 18.w,icon: const Icon(Icons.arrow_back_ios), onPressed: (){
                Navigator.of(context).pop();
              },
              ),
            ),
            PokeNameType(pokemon: pokemon,),
            SizedBox(height: 20.h,),
            Expanded(child: Stack(
              children: [
                Positioned(child: Image.asset(pokeballImageUrl, height: 0.15.sh, fit: BoxFit.fitHeight,), right: 0, top: 0,),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemon: pokemon)),
                Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(imageUrl: pokemon.img ?? '', height: 0.25.sh, fit: BoxFit.fitHeight,),
                ),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
