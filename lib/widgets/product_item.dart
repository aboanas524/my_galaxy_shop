
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/Products.dart';
import 'package:galaxy_shop_1/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

//
class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
  final String title;
  final String id;
  final String imageUrl;
  final double price;
  bool isFavorite;
  final String description;
  ProductItem(this.id,this.title,this.imageUrl,this.price,this.isFavorite,this.description);
}
// بناء كل منتج في الغريد فيو
class _ProductItemState extends State<ProductItem> {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){ return ProductDetailScreen(widget.id,widget.title,widget.imageUrl,widget.price,widget.isFavorite,widget.description);}));
      },
      child: GridTile(
        child: Image.asset(widget.imageUrl,fit:BoxFit.cover,),
        footer: GridTileBar(
          backgroundColor: Colors.black26,
          title: Text(widget.title,style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
          subtitle: Text('${widget.price}\$',style: TextStyle(color: Colors.white,),textAlign: TextAlign.right,),
          trailing: IconButton(
            icon: Icon(Icons.favorite),
            iconSize: 30,
            color: widget.isFavorite?Colors.red:Colors.grey,
            onPressed: (){
              setState(() {
                 widget.isFavorite?widget.isFavorite=false:widget.isFavorite=true;

              });
              for(int i=0;i<productsData.items.length;i++)
                {
                  if(productsData.items[i].id==widget.id)
                    {
                      productsData.items[i].isFavorite=widget.isFavorite;
                    }
                }
            },
          ),
        ),
      ),
    );
  }
}
