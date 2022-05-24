import 'package:dio/dio.dart';
import 'package:mobile_pokedex/src/models/pokemon_model.dart';
import 'package:mobile_pokedex/src/pokedex_repository_interface.dart';

class PokedexRepository implements IPokedexRepository {

  
  @override
  Future<List<Pokemon>> getMyPokemons() async {
    Response result;
    var dio = Dio();
    result = await dio.get('http://localhost:3000/pokemon');

  if (result.statusCode == 200) {
      var pokemons = result.data
           ?.map((item) => Pokemon.fromMap(item))
           .toList();
      List<Pokemon> users = pokemons.cast<Pokemon>();
      return users;
    } else {
      throw Exception(result.statusMessage);
    }
    
  }
  
  @override
  Future<String> updateIsCatch(String name, bool isCatch) async{
    var dio = Dio();
    Response response = await dio.patch('http://localhost:3000/pokemon/${name}', data: {'isCatch': isCatch} );
     if (response.statusCode == 200) {
      return 'sucesso';
    } else {
      throw Exception(response.statusMessage);
    }

  }
}
