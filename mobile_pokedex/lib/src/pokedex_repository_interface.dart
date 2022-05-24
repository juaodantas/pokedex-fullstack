import 'package:mobile_pokedex/src/models/pokemon_model.dart';

abstract class IPokedexRepository {
  Future<List<Pokemon>> getMyPokemons();
  Future<String> updateIsCatch(String name,bool isCatch);
}