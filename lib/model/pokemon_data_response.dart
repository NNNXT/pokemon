// Internal Modules
import 'package:pokemon/model/pokemon_data.dart';

class PokemonDataResponse {
  final PokemonData? result;

  PokemonDataResponse({this.result});

  factory PokemonDataResponse.fromJson(Map<String, dynamic> json) =>
      PokemonDataResponse(
        result: PokemonData.fromJson(json),
      );
}
