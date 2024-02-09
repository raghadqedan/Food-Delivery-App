import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/app_colors.dart';

import '../../models/products.dart';

class ProductItem extends StatefulWidget {
  final Product dummyProduct;
  const ProductItem({super.key, required this.dummyProduct});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Image.network(
                widget.dummyProduct.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(widget.dummyProduct.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text(widget.dummyProduct.category.title,
                style: Theme.of(context).textTheme.titleSmall),
            Text(
              '\$${widget.dummyProduct.price}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: InkWell(
            onTap: () {
              setState(() {
                if (widget.dummyProduct.isFavorite) {
                  widget.dummyProduct.isFavorite = false;
                  favoritesProducts.remove(widget.dummyProduct);
                } else {
                  widget.dummyProduct.isFavorite = true;
                  favoritesProducts.add(widget.dummyProduct);
                }
              });
            },
            child: DecoratedBox(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.wight),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: 
                   Icon(
                   widget.dummyProduct.isFavorite ? Icons.favorite:Icons.favorite_outline,
                    color: Theme.of(context).primaryColor,),
                )),
          ),
        ),
      ]),
    );
  }
}
