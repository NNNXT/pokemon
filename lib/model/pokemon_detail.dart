// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail.g.dart';

@JsonSerializable(createToJson: false)
class PokemonDetail {
  @JsonKey(name: 'front_default')
  String? frontDefault;

  PokemonDetail({this.frontDefault});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);
}
