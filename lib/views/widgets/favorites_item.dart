import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/app_colors.dart';
import 'package:food_delivary_app/utils/app_rotes.dart';

import '../../models/products.dart';


class FavoritesItem extends StatelessWidget {
  final Product favProduct;
  VoidCallback onTap;

  FavoritesItem({super.key, required this.favProduct, required this.onTap});

  @override
  Widget build(BuildContext context) {
      final orientation =MediaQuery.of(context).orientation;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRotes().productDetail,arguments:favProduct);
          },
          child: Card(
            elevation: 6.0,
            color: Colors.white,
            child: Row(children: [
              Image.network(
                favProduct.imgUrl,
                height: 70,
                width: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favProduct.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  Text(favProduct.category.title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('\$${favProduct.price}'),
                ],
              )
            ]),
          ),
        ),
        Positioned(
          top: 15,
          right: 20,
          child: orientation ==Orientation.portrait?IconButton(
            icon:const Icon(Icons.favorite),
            onPressed: onTap,
            color: Theme.of(context).primaryColor,
          ):TextButton.icon(
            icon:const Icon(Icons.favorite),
            onPressed: onTap,
            label: const Text('Favorites'),
          )
        ),
      ],
    );
  }
}
