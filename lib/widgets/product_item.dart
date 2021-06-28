import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/Providers/favorites.dart';
import 'package:galaxy_shop_1/models/product.dart';
import 'package:galaxy_shop_1/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

//
class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
  final Product product;
  ProductItem(
    this.product,
  );
}

// بناء كل منتج في الغريد فيو
class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetailScreen(widget.product);
        }));
      },
      child: GridTile(
        child: Image.network(
          widget.product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black26,
          title: Text(
            widget.product.title,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            '${widget.product.price}\$',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.right,
          ),
          trailing: IconButton(
            icon: Icon(Icons.favorite),
            iconSize: 30,
            color: fav.favContent.contains(widget.product)
                ? Colors.red
                : Colors.grey,
            onPressed: () {
              if (fav.favContent.contains(widget.product))
                fav.removeFromFav(widget.product);
              else
                fav.addToFav(widget.product);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
