import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/component/customCard.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/allCategoriesService.dart';
import 'package:store_app/services/allProductService.dart';
import 'package:store_app/services/getCategoriesService.dart';

Color primaryColor = Colors.orange ;

class homePage extends StatelessWidget {
  const homePage({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
              color: primaryColor,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 70,),
            const Text('New',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text('Trend',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
        //future Builder
        child: FutureBuilder<List<productModel>>(
          future: allProductService().getAllProducts(),
          builder: (context, AsyncSnapshot<List<productModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if (snapshot.hasData) {
              List <productModel> products = snapshot.data! ;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 30.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return customCard(product: products[index]);
                },
              );
            }
            else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
