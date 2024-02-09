import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/app_colors.dart';

import '../../models/products.dart';
import '../widgets/counter_widget.dart';
import '../widgets/product_specs_item.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        actions: [
          IconButton(onPressed: () {
             setState(() {
                if (widget.product.isFavorite) {
                  widget.product.isFavorite = false;
                  favoritesProducts.remove(widget.product);
                } else {
                 widget.product.isFavorite = true;
                  favoritesProducts.add(widget.product);
                }
              });
          }, icon:  Icon(  widget.product.isFavorite ? Icons.favorite:Icons.favorite_outline, color:Theme.of(context).primaryColor))
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.grey2),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 50),
                child: Image.network(widget.product.imgUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.product.category.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.grey),
                            ),
                          ],
                        ),
                        const CounterWidget(),
                      ]),
                  const SizedBox(
                    height: 16,
                  ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                       ProductSpecsItem(title: "Size", value: "Large"),
                       SizedBox(height: 30, child: VerticalDivider()),
                      ProductSpecsItem(title: "Calories", value: "120 cal"),
                       SizedBox(height: 30, child: VerticalDivider()),
                      ProductSpecsItem(title: "Cooking", value: "10 mins"),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(widget.product.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.grey)),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          '\$${widget.product.price.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                        )),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  foregroundColor: AppColors.wight,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              child: const Text("Add To Cart"),
                            ),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
