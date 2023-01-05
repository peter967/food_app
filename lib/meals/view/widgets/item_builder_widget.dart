import 'package:flutter/material.dart';

import '../../model/model.dart';
import 'details_widget.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    Key? key,
    required this.result,
  }) : super(key: key);

  final List<Meals> result;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, i) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  return Details(
                    itemName: result[i].strMeal,
                    itemImage: result[i].strMealThumb,
                    desc: result[i].strInstructions,
                    youtubeLink: result[i].strYoutube,
                  );
                }),
              ),
            );
          },
          title: Text(
            result[i].strMeal,
          ),
          textColor: Colors.amber,
          leading: CircleAvatar(
            radius: 25,
            foregroundImage: NetworkImage(
              result[i].strMealThumb,
            ),
          ),
        );
      },
      itemCount: result.length,
      separatorBuilder: (context, i) {
        return const Divider();
      },
    );
  }
}
