import 'package:flutter/material.dart';
import 'package:kuis_prak_mobile/pages/halaman_dua.dart';
import 'package:kuis_prak_mobile/pokemon_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final PokemonData pokemon = listPokemon[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HalamanDua(
                    Pikachu: pokemon,
                  );
                },
              ));
            },
            child: Container(
              height: 100,
              width: 100,
              child: Column(children: [
                Image.network(
                  pokemon.image,
                  height: 100,
                  width: 100,
                ),
                Text(pokemon.name)
              ]),
            ),
          );
        },
        itemCount: listPokemon.length,
      ),
    );
  }
}
