// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:pokemon/model/pokemon.dart';

part 'pokemon_data.g.dart';

@JsonSerializable(createToJson: false)
class PokemonData {
  num? count;

  String? next;

  String? previous;

  List<Pokemon>? results;

  PokemonData({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      _$PokemonDataFromJson(json);
}
