import 'package:flutter/material.dart';
import 'package:food_app/cocktail/view/widgets/cocktail_details.dart';

import '../../model/cocktail_model.dart';

class CocktailItemBuilder extends StatelessWidget {
  const CocktailItemBuilder({
    Key? key,
    required this.result,
  }) : super(key: key);

  final List<Drinks> result;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CocktailDetails(
                    itemName: result[i].strDrink,
                    itemImage: result[i].strDrinkThumb,
                    desc: result[i].strCategory,
                  );
                },
              ),
            );
          },
          leading: CircleAvatar(
            radius: 25,
            foregroundImage: NetworkImage(
              result[i].strDrinkThumb,
            ),
          ),
          title: Text(result[i].strDrink),
          textColor: Colors.amber,
        );
      },
      separatorBuilder: (context, i) {
        return const Divider();
      },
      itemCount: result.length,
    );
  }
}
