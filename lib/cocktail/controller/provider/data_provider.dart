import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/cocktail/controller/provider/provider.dart';

final cocktailDataProvider = FutureProvider((ref) async {
  return ref.watch(cocktailProvider).getData();
});
