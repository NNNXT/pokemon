// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(createToJson: false)
class Pokemon {
  String? name;

  String? url;

  bool isSelect;

  Pokemon({
    this.name,
    this.url,
    this.isSelect = false,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
