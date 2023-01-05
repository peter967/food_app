import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/cocktail/view/home.dart';
import 'package:food_app/meals/view/widgets/item_builder_widget.dart';

import '../controller/providers/data_provider.dart';
import '../model/model.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Drawer Header',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ListTile(
              title: const Text(
                'Cocktail',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              leading: Image.asset(
                'assets/images/cocktail.png',
                fit: BoxFit.cover,
                height: 55,
                width: 55,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CocktailHome(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text('    Meals'),
      ),
      body: data.when(
        data: (data) {
          final List<Meals> result = data.map((e) => e).toList();
          return ItemBuilder(result: result);
        },
        error: (e, s) {
          return Center(child: Text(e.toString()));
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
