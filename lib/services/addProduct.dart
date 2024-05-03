import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/productModel.dart';

class addProduct
{
  Future <productModel> addProductService ({required String title , required double price ,required String description ,required String image ,required String category}) async
  {
  Map<String,dynamic> data = await  api().put(url: 'https://fakestoreapi.com/products', body: {
   ' title': title,
    'price': price,
    'description': description,
    'image': image,
    'category': category
    },);

    return productModel.fromJson(data);
  }
}