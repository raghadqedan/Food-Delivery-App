import 'package:flutter/material.dart';
import '../../models/products.dart';
import '../widgets/favorites_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    // if (favoritesProducts.isEmpty) {
    //   return const Center(
    //     child: Text("No Favorites Product"),
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://tb-static.uber.com/prod/image-proc/processed_images/314746d6ee9e80a46546a1ceace4dd11/69ad85cd7b39888042b3bbf1c22d630d.jpeg',
              height: 250,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          favoritesProducts.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favoritesProducts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Product favproduct = favoritesProducts[index];
                    return FavoritesItem(
                        favProduct: favproduct,
                        onPressed: () {
                          setState(() {
                            if (favproduct.isFavorite) {
                              favproduct.isFavorite = false;
                              favoritesProducts.remove(favproduct);
                            } else {
                              favproduct.isFavorite = true;
                              favoritesProducts.add(favproduct);
                            }
                          });
                        });
                  })
              : Padding(
                  padding: const EdgeInsets.only(top: 59),
                  child: Center(
                    child: Text(
                      "No Favorites Product",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
        ]),
      ),
    );
  }
}
