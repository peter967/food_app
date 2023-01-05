import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/cocktail/controller/provider/data_provider.dart';
import 'package:food_app/cocktail/model/cocktail_model.dart';
import 'package:food_app/cocktail/view/widgets/cocktail_item_bulder.dart';
import 'package:food_app/meals/view/home.dart';

class CocktailHome extends ConsumerWidget {
  const CocktailHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(cocktailDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const Home();
            }));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: data.when(
        data: (data) {
          final List<Drinks> result = data.map((e) => e).toList();
          return CocktailItemBuilder(result: result);
        },
        error: (e, s) {
          return Center(
            child: Text(e.toString()),
          );
        },
        loading: () {
          return null;
        },
      ),
    );
  }
}
