import 'package:flutter/material.dart';
import 'modelclass.dart';

class View extends StatefulWidget {
  Product product;
  View(this.product);
final List<String> ingList = [
  '',
];

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.network("https://www.google.com/search?q=senary&rlz=1C1GIVA_enBD881BD881&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjgoteJ1Lr1AhXywjgGHcBzCJEQ_AUoAXoECAIQAw&biw=1366&bih=625&dpr=1#imgrc=Up76ZeDZ0myhttps://www.google.com/search?q=senary&rlz=1C1GIVA_enBD881BD881&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjgoteJ1Lr1AhXywjgGHcBzCJEQ_AUoAXoECAIQAw&biw=1366&bbTM"),
          ),
          Text( "Product Name:"+widget.product.name,textAlign: TextAlign.start,),
          Text("Product Price:"+widget.product.price,textAlign: TextAlign.right,),
          Text("Product Selling price:"+widget.product.sellingPrice,textAlign: TextAlign.right,)
        ],
      ),
    );
  }
}
