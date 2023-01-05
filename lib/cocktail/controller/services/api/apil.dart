import 'package:dio/dio.dart';
import 'package:food_app/cocktail/model/cocktail_model.dart';

class CocktailApi {
  final String _endPoint =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=';
  final Dio _dio = Dio();
  late final Response _response;
  Future<List<Drinks>> getData() async {
    _response = await _dio.get(_endPoint);
    final List result = _response.data['drinks'];

    print(result.toString());

    final data = result.map((e) => Drinks.fromJson(e)).toList();
    return data;
  }
}
