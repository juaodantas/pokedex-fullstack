import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_pokedex/src/pokedex_store.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final PokedexStore pokedexStore = PokedexStore();

  @override
  void initState() {
    super.initState();
    pokedexStore.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 70,
                child: TextFormField(
                  controller: pokedexStore.name,
                  onEditingComplete: () async {
                    await pokedexStore.updatePokemon(
                        pokedexStore.name.text, true);
                    pokedexStore.getPokemons();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await pokedexStore.updatePokemon(
                      pokedexStore.name.text, true);
                  pokedexStore.getPokemons();
                },
                child: Text('Capturar'),
              ),
            ],
          ),
          Observer(builder: (_) {
            if (pokedexStore.statusPage == Status.done && pokedexStore.pokemonList.isEmpty) {
              return const Text(' Ainda não capturou nenhum pokemon ');
            }
            if (pokedexStore.statusPage == Status.waiting){
              return const CircularProgressIndicator();
            }
            return Expanded(
              child: ListView.builder(
                  itemCount: pokedexStore.pokemonList.length,
                  itemBuilder: (context, index) {
                    return Observer(
                      builder: (__) {
                        return ListTile(
                          title: Text(pokedexStore.pokemonList[index].name ?? ''),
                          trailing: IconButton(
                            onPressed: () async {
                              var message = await pokedexStore.updatePokemon(
                                  pokedexStore.pokemonList[index].name!, false);
                              
                              if (message != null && message == 'sucesso') {
                                print(message);
                                pokedexStore.getPokemons();
                              }
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      }
                    );
                  }),
            );
          })
        ],
      ),
    );
  }

  void loading() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          content: Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
