import 'package:flutter/cupertino.dart';
import 'package:mobile_pokedex/src/models/pokemon_model.dart';
import 'package:mobile_pokedex/src/pokedex_repository.dart';
import 'package:mobx/mobx.dart';

part 'pokedex_store.g.dart';

class PokedexStore = _PokedexStoreBase with _$PokedexStore;

abstract class _PokedexStoreBase with Store {
  final PokedexRepository pokedexRepository = PokedexRepository();

  @observable
  Status statusPage = Status.done;

  @observable
  List<Pokemon> pokemonList = [];

  @observable 
  TextEditingController name = TextEditingController();

  // Get Pokemon list
  @action 
  getPokemons() async{
    statusPage = Status.waiting;
    var pokemons;
    try{
      pokemons = await pokedexRepository.getMyPokemons();
    }catch(e){
      statusPage = Status.error;
    }
    if(pokemons != null){
      pokemonList = List.from(pokemons);
    }else{
      pokemonList = List.from([]);
    }
    await Future.delayed(const Duration(microseconds: 500));
    statusPage = Status.done;

  }

  // Add Pokemon
  @action
  updatePokemon(String pokemon,bool isCatch) async {
    statusPage = Status.waiting;
    try{
       await pokedexRepository.updateIsCatch(pokemon, isCatch);
    }catch(e){
      statusPage = Status.error;
      return 'falhou';     
    }
    await Future.delayed(const Duration(microseconds: 1000));
    statusPage = Status.done;
    return 'sucesso'; 
  }

}

enum Status {
    waiting,
    done,
    error
}