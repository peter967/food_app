import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/meals/controller/providers/provider.dart';

final dataProvider = FutureProvider((ref) async {
  return ref.watch(provider);
});
