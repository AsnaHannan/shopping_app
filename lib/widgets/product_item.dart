import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/global.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart.dart';

class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;
  
  // const ProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer:  GridTileBar(
          backgroundColor: Colors.black87,
          leading:  IconButton(
            color: Theme.of(context).accentColor,
            onPressed: (){
              product.toggleFavoriteStatus();
            }, 
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border)),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () { 
              cart.addItem(product.id, product.price, product.title);
             },),
      ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteNames.productDetailPageRoute,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,),
        ),
      ),
    );
  }
}