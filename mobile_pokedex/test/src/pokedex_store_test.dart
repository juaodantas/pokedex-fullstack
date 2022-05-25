import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_pokedex/src/models/pokemon_model.dart';
import 'package:mobile_pokedex/src/pokedex_repository_interface.dart';
import 'package:mobile_pokedex/src/pokedex_store.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IPokedexRepository {}

void main() {
  test('Deve inserir o pokemon e atualizar a lista',
      () async {
    final store = PokedexStore();
    Pokemon pokemon = Pokemon(id: '1',url:'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg' ,name: 'pikachu', isCatch: true);

    await store.updatePokemon('pikachu', true);
    await store.getPokemons();
    expect(store.pokemonList.length, greaterThanOrEqualTo(1));
    expect(store.pokemonList, anyElement((item)=>item.name == 'pikachu'));
  });
}
