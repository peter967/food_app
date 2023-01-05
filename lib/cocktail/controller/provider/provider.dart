import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/cocktail/controller/services/api/apil.dart';

final cocktailProvider = Provider(
  (_) {
    return CocktailApi();
  },
);
