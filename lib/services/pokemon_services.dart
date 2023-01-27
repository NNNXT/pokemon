// Flutter Modules
import 'dart:convert';

// External Modules
import 'package:http/http.dart' as http;

// Internal Modules
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/pokemon_data_response.dart';

class PokemonService {
  Future<List<Pokemon>> getPokemons({
    int limit = 20,
    int offset = 0,
  }) async {
    var url = 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var rawData = json.decode(response.body);
      var results = PokemonDataResponse.fromJson(rawData);
      return results.result?.results ?? [];
    }
    return [];
  }
}
