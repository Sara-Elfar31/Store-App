import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/updateProduct.dart';

class updateProductPage extends StatefulWidget {
  updateProductPage({super.key});

  @override
  State<updateProductPage> createState() => _updateProductPageState();
}

class _updateProductPageState extends State<updateProductPage> {
  String? productName , image , descreption , category;

  double? price ;
  bool isLoading = false ;
  @override
  Widget build(BuildContext context) {

    productModel product  = ModalRoute.of(context)!.settings.arguments  as productModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.orange),
          centerTitle: true,
          title: const Row(
          children: [
            SizedBox(width: 30,),
            Text('Update',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text('Product',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)
          ],
        ),),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 100,),
              TextField(
                onChanged: (value) {
                  productName= value ;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Product Name',
                  hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                onChanged: (value) {
                  descreption = value ;
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Description',
                    hintStyle: const TextStyle(color: Colors.grey)

                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  price = double.parse(value);
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Price',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                onChanged: (value) {
                  image = value ;
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Image',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 30,),
              TextField(
                onChanged: (value) {
                  category = value ;
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Category',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                width: 50,
                height: 50,
                child: MaterialButton(
                  color: Colors.orange,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    onPressed: () async {
                    isLoading = true ;
                    setState(() {});
                    await updateProductMethod(product);
                  try {

                    print('success');
                  } catch (e) {
                    print(e);
                  }
                    isLoading = false ;
                    setState(() {});
                }, child: const Text('Update',style: TextStyle(color: Colors.black,fontSize: 18),)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(productModel product) async {
   await updateProduct().updateProductService(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: descreption == null ? product.description : descreption!,
        image: image == null ? product.image : image! ,
        category: category == null ? product.category! : category!,
    );
  }
}
