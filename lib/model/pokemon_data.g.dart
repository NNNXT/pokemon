// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonData _$PokemonDataFromJson(Map<String, dynamic> json) => PokemonData(
      count: json['count'] as num?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
