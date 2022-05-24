// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokedexStore on _PokedexStoreBase, Store {
  late final _$statusPageAtom =
      Atom(name: '_PokedexStoreBase.statusPage', context: context);

  @override
  Status get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(Status value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  late final _$pokemonListAtom =
      Atom(name: '_PokedexStoreBase.pokemonList', context: context);

  @override
  List<Pokemon> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<Pokemon> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_PokedexStoreBase.name', context: context);

  @override
  TextEditingController get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(TextEditingController value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('_PokedexStoreBase.getPokemons', context: context);

  @override
  Future getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  late final _$updatePokemonAsyncAction =
      AsyncAction('_PokedexStoreBase.updatePokemon', context: context);

  @override
  Future updatePokemon(String pokemon, bool isCatch) {
    return _$updatePokemonAsyncAction
        .run(() => super.updatePokemon(pokemon, isCatch));
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
pokemonList: ${pokemonList},
name: ${name}
    ''';
  }
}
