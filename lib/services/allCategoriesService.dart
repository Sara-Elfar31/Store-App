import 'dart:convert';
import 'package:http/http.dart';
import 'package:store_app/helper/Api.dart';
class allCategoriesService
{
  
  
  Future <List<dynamic>> getAllCategories () async
  {
    Response response = await api().get(url: 'https://fakestoreapi.com/products/categories');
      List <dynamic> data =  jsonDecode(response.body);
      return data ;
    }

}