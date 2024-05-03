import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/productModel.dart';

class gatCegoriesServices
{
  Future<List<productModel>> getCategoriesProducts({required String categoryName}) async
  {
   Response response = await api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

     List <dynamic> data = jsonDecode(response.body);
     List <productModel> categoryList = [] ;
     for(int i = 0 ; i < data.length ; i++)
       {
         categoryList.add(productModel.fromJson(data[i]));
       }

     return categoryList ;
   }
}