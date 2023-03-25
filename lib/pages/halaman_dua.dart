import 'package:flutter/material.dart';
import '../pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDua extends StatefulWidget {
  final PokemonData Pikachu;
  const HalamanDua({super.key, required this.Pikachu});

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Scaffold(
      appBar: AppBar(title: Text('List Pokemon'), actions: [
        IconButton(
          onPressed: () {
            // SnackBar(content: Text('Berhasil Menambahkan ke Favorit'));

            setState(() {
              if (widget.Pikachu.isFavorite == true) {
                widget.Pikachu.isFavorite = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Berhasil ditambahkan ke Favorit'),
                    backgroundColor: Colors.blue,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              } else {
                widget.Pikachu.isFavorite = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Berhasil Hapus dari Favorit'),
                    backgroundColor: Colors.blue,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }
              // widget.Pikachu.isFavorite = true;
            });
          },
          icon: (widget.Pikachu.isFavorite)
              ? Icon(Icons.star_border)
              : Icon(Icons.star),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.Pikachu.wikiUrl);
          // print(widget.Pikachu.wikiUrl);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.catching_pokemon,
          size: 45,
        ),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(widget.Pikachu.image),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.Pikachu.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Net Evolution : ${widget.Pikachu.nextEvolution.toString()}'),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Weakness : ${widget.Pikachu.weakness.toString()}'),
                            SizedBox(
                              height: 20,
                            ),
                            Text(widget.Pikachu.prevEvolution.toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'could not launch $_url';
  }
}
