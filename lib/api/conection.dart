import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:show_me_pokemon/model/Pokemon.dart';

class ConectarPokemon {
  Future<Pokemon> fetch(String nomePoke) async {// Realiza a consulta no BD e retorna um JSON
    try {
      var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/' + nomePoke.toLowerCase().trim()));
      return Pokemon.fromJson(jsonDecode(response.body));
    } catch (e) {
      return throw Exception(e);
    }
  }
}
