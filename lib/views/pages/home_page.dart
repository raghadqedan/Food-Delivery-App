import 'package:flutter/material.dart';
import 'package:food_delivary_app/models/category.dart';
import 'package:food_delivary_app/models/products.dart';
import 'package:food_delivary_app/utils/app_colors.dart';
import 'package:food_delivary_app/views/pages/product_details.dart';

import '../widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<Product> fillteredProductes;

  @override  
  void initState(){
      super.initState();
      fillteredProductes=dummyProducts;
      }
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
                'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/delicious-food-banner-template-design-cd3994e39458960f4f33e73b8c60edb9_screen.jpg'),
          ),
          const SizedBox(height: 16),
          const TextField(
              decoration: InputDecoration(
            labelText: 'Find your food',
            prefixIcon: Icon(Icons.search),
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                itemBuilder: (context, index) {
                  final dummyCategorie = dummyCategories[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                          
                          if(selectedCategoryId==dummyCategorie.id){
                            selectedCategoryId=null;
                            fillteredProductes=dummyProducts;
                          }else{
                              selectedCategoryId =  dummyCategorie.id;
                            fillteredProductes=dummyProducts.where((product) =>product.category.id==selectedCategoryId ,).toList();
                            
                        }    });
                    },
                    child: Card(
                      color: selectedCategoryId == dummyCategorie.id
                          ? Theme.of(context).primaryColor
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                color: selectedCategoryId == dummyCategorie.id
                                    ? Colors.white
                                    : null,
                                dummyCategorie.imgUrl,
                                width: 50,
                              ),
                              Text(
                                dummyCategorie.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: selectedCategoryId ==
                                              dummyCategorie.id
                                          ? AppColors.wight
                                          : null,
                                    ),
                              )
                            ]),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 16,
          ),
          if(fillteredProductes.isNotEmpty)
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
            ),
            itemCount: fillteredProductes.length,
            itemBuilder: (context, index) {
              final dummyProduct = fillteredProductes[index];
              //Navigator.of(context). use this to access the navigation stack of my app 
              return InkWell(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_) => ProductDetails(product:dummyProduct),),).then((value) => setState((){})),
                child: ProductItem(dummyProduct:dummyProduct,));
            },
          ),
          if(fillteredProductes.isEmpty)
              const Center(child: Text("No Products Found"))
        ]),
      ),
    );
  }
}
