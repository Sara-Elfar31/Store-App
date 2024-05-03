import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/productModel.dart';

class updateProduct
{
  Future <productModel> updateProductService ({required dynamic id ,required String title , required double price ,required String description ,required String image ,required String category}) async
  {
    Map <String,dynamic> data = await  api().put(url: 'https://fakestoreapi.com/products/:$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    },);

    return productModel.fromJson(data);
  }
}