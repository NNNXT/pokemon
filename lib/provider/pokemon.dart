// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/services/pokemon_services.dart';

class PokemonProvider extends ChangeNotifier {
  final _service = PokemonService();

  final List<Pokemon> _pokemons = [];
  final List<Pokemon> _pokemonTeam = [];

  bool isLoading = false;
  bool get canAddPokemonTeams => _pokemonTeam.length < 6;

  List<Pokemon> get pokemons => _pokemons;
  List<Pokemon> get pokemonTeam => _pokemonTeam;

  String get countPokemonSelectText => _pokemonTeam.length.toString();

  Future<void> getPokemons({
    bool needSetLoading = false,
  }) async {
    if (needSetLoading) {
      isLoading = true;
      notifyListeners();
    }
    final response = await _service.getPokemons(offset: _pokemons.length);
    _pokemons.addAll(response);
    notifyListeners();
    if (needSetLoading) {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectPokemon(index) {
    _pokemons[index].isSelect = !_pokemons[index].isSelect;
    if (_pokemons[index].isSelect) {
      _pokemonTeam.add(_pokemons[index]);
    } else {
      _pokemonTeam.remove(_pokemons[index]);
    }
    notifyListeners();
  }

  void clearPokemonTeam() {
    for (var pokemon in pokemons) {
      if (pokemon.isSelect) {
        pokemon.isSelect = false;
      }
    }
    _pokemonTeam.clear();
    notifyListeners();
  }
}
