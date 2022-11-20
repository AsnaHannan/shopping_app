import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
 final bool showFavs;

  const ProductsGrid(this.showFavs, {super.key});
  // final List <Product> loadedProducts ;

  // const ProductsGrid({super.key, this.loadedProducts});
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    // final products = productsData.items;
     final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: products.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // create: (c) => products[i],
            value: products[i],
            child : ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl
            ) 
            ), 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )
          
          );
  }
}