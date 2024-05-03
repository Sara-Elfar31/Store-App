import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/productModel.dart';


class allProductService
{
 Future <List<productModel>> getAllProducts () async
  {
    Response response = await api().get(url: 'https://fakestoreapi.com/products');
     List <dynamic> data = jsonDecode(response.body);
     List<productModel> productList = [] ;
     for(int i = 0 ; i < data.length ; i++)
       {
         productList.add(productModel.fromJson(data[i]));
       }
     return productList ;
   }
}