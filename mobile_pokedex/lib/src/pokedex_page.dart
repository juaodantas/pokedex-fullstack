import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: const Color(0xff262835),
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: 240.0,
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(
              child: Image.asset('assets/Logo.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.grey[800],
                      filled: true,
                      isDense: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () async {
                            await pokedexStore.updatePokemon(
                                pokedexStore.name.text, true);
                            pokedexStore.getPokemons();
                          },
                          child: const Text(
                            'Capturar',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Digite o nome de um pokemon'),
                  controller: pokedexStore.name,
                  onEditingComplete: () async {
                    await pokedexStore.updatePokemon(
                        pokedexStore.name.text, true);
                    pokedexStore.getPokemons();
                  },
                ),
              ),
            ],
          ),
          Observer(builder: (_) {
            if (pokedexStore.statusPage == Status.done &&
                pokedexStore.pokemonList.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ' Ainda não capturou nenhum Pokemon ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            if (pokedexStore.statusPage == Status.waiting) {
              return const CircularProgressIndicator();
            }
            return Expanded(
              child: ListView.builder(
                  itemCount: pokedexStore.pokemonList.length,
                  itemBuilder: (context, index) {
                    return Observer(builder: (__) {
                      return Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 220,
                          width: double.maxFinite,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Stack(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: SizedBox(
                                                            width: 150,
                                                            height: 150,
                                                            child: SvgPicture
                                                                .network(
                                                                    //  height: 100,
                                                                    //  width: 50,
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                    pokedexStore
                                                                        .pokemonList[
                                                                            index]
                                                                        .url!),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      ' ID: ${pokedexStore.pokemonList[index].id!}',
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Nome: ${pokedexStore.pokemonList[index].name!}",
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    const Spacer(),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  Colors.red),
                                                      onPressed: () async {
                                                        await pokedexStore
                                                            .updatePokemon(
                                                                pokedexStore
                                                                    .pokemonList[
                                                                        index]
                                                                    .name!,
                                                                false);
                                                        pokedexStore
                                                            .getPokemons();
                                                      },
                                                      child: const Text(
                                                        'Retirar da pokedex',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ));
                    });
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
          content: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
