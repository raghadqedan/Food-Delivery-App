import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../pages/product_details.dart';

class FavoritesItem extends StatelessWidget {
  final Product favProduct;
  VoidCallback onPressed;

  FavoritesItem({super.key, required this.favProduct, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetails(product: favProduct)));
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
          child: InkWell(
            onTap: () {
              onPressed();
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
