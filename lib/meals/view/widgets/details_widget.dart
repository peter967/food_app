import 'package:flutter/material.dart';

import 'web_view.dart';

class Details extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final String desc;
  final String youtubeLink;

  const Details({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.desc,
    required this.youtubeLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return WebViewScreen(
                            url: youtubeLink,
                          );
                        }),
                      ),
                    );
                  },
                  child: Image.network(
                    itemImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  itemName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
