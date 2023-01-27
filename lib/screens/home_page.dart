// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';

// Internal Modules
import 'package:pokemon/provider/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<PokemonProvider>(context, listen: false).getPokemons(
          needSetLoading: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(
      builder: (_, value, __) {
        final pokemons = value.pokemons;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pokemon API'),
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              var metrics = scrollInfo.metrics;
              var loadmore = metrics.pixels == metrics.maxScrollExtent;
              if (loadmore) {
                value.getPokemons();
              }
              return false;
            },
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (_, index) {
                    final pokemon = pokemons[index];
                    return ListTile(
                      tileColor: pokemon.isSelect ? Colors.green : Colors.white,
                      onTap: () {
                        if (value.canAddPokemonTeams) {
                          value.selectPokemon(index);
                        } else {
                          if (pokemon.isSelect) {
                            value.selectPokemon(index);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('คุณสามารถเลือกได้แค่ 6 ตัว'),
                              ),
                            );
                          }
                        }
                      },
                      title: Text(
                        pokemon.name ?? '',
                      ),
                    );
                  },
                ),
                if (value.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: null,
                child: Text(value.countPokemonSelectText),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                onPressed: () {
                  value.clearPokemonTeam();
                },
                child: const Icon(Icons.restore),
              ),
            ],
          ),
        );
      },
    );
  }
}
