import 'package:mobile_pokedex/src/models/pokemon_model.dart';
import 'package:mobile_pokedex/src/pokedex_repository.dart';
import 'package:mobx/mobx.dart';

part 'pokedex_store.g.dart';

class PokedexStore = _PokedexStoreBase with _$PokedexStore;

abstract class _PokedexStoreBase with Store {
  final PokedexRepository pokedexRepository = PokedexRepository();

  @observable
  List<Pokemon> pokemonList = [];

  @action 
  getPokemons() async{
    var pokemons;
    try{
      pokemons = await pokedexRepository.getMyPokemons();
    }catch(e){
      return [];
    }
    if(pokemons != null){
      pokemonList = List.from(pokemons);
    }
  }
}