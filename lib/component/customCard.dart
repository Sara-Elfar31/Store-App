import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/screens/updateProduct.dart';
import 'package:store_app/services/updateProduct.dart';

class customCard extends StatelessWidget {
   customCard({
    super.key,
    required this.product,
  });

   productModel product ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'updateProduct',arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children:[
            Container(
              height: 140,
              padding: const EdgeInsets.only(left: 10),
              // decoration: BoxDecoration(
              //     boxShadow: [BoxShadow(blurRadius: 40.0 ,color: Colors.grey.withOpacity(0.0) ,spreadRadius: 0.0,offset: const Offset(10.0, 10.0))]),
              child: Card(
                color: const Color(0xFFffffff),
                //elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title.substring(0,6),style: const TextStyle(color: Colors.grey,fontSize: 16),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ ${product.price.toString()}',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                          IconButton(onPressed: (){} ,icon : const Icon(Icons.favorite,color: Colors.red,))
                        ],)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 32,
                bottom: 120,
                child: Image.network(product.image, height:80,width: 80,)),
          ]
      ),
    );
  }
}