import 'package:flutter/material.dart';
import 'package:show_me_pokemon/model/Pokemon.dart';
import '../api/conection.dart';

class PesquisaPokemon extends StatefulWidget {
  const PesquisaPokemon({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PesquisaPokemon> createState() => _PesquisaPokemonState();
}

class _PesquisaPokemonState extends State<PesquisaPokemon> {
  final nomePoke = TextEditingController();

  var pokemon = Pokemon();

  int id = 0;
  String nome = '';
  String img = '';
  int altura = 0;
  int peso = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome ou numero',
                  ),
                  controller: nomePoke,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                height: 200,
                child: Image.network(img),
              ),
              const SizedBox(
                height: 40,
              ),
              Text("N°: " + id.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30)),
              const SizedBox(
                height: 10,
              ),
              Text("Nome: " + nome, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 8,
              ),
              Text("Altura: " + altura.toString().padLeft(2, '0,') + " m", textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height:8,
              ),
              Text("Peso: " + peso.toString().padLeft(4, '0,'), textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber),
                    ),
                    onPressed: () {
                      exibir();
                    },
                    child: const Text('Escolho Voce!'),
                  )),
            ],
          )),
    );
  }

  void exibir() async {// realiza a exibicao dos dados

    try {
      pokemon = (await ConectarPokemon().fetch(nomePoke.text));

      id = pokemon.id!;
      nome = pokemon.name!;
      img = pokemon.sprites!.other!.officialArtwork!.frontDefault!;
      altura = pokemon.height!;
      peso = pokemon.weight!;

      setState(() {
        id;
        nome;
        img;
        altura;
        peso;
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
