import 'package:dio/dio.dart';
import 'package:mobile_pokedex/src/models/pokemon_model.dart';
import 'package:mobile_pokedex/src/pokedex_repository_interface.dart';

class PokedexRepository implements IPokedexRepository {

  
  @override
  Future<List<Pokemon>> getMyPokemons() async {
    Response response;
    var dio = Dio();
    response = await dio.get('http://localhost:3000/pokemon');
    print(response.data.toString());
    throw UnimplementedError();
  }
}
