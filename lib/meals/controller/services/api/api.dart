import 'package:dio/dio.dart';

import '../../../model/model.dart';

class Api {
  final String _endPoint =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';
  final Dio _dio = Dio();
  late final Response _response;
  Future<List<Meals>> getData() async {
    _response = await _dio.get(_endPoint);
    final List result = _response.data['meals'];
    final data = result.map((e) => Meals.fromJson(e)).toList();

    return data;
  }
}
