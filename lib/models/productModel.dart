import 'package:store_app/models/ratingModel.dart';

class productModel
{

  final int id ;
  final String title ;
  final double price ;
  final String description ;
  final String image ;
  final ratingModel rating ;
  String? category ;


productModel({required this.id, required this.title, required this.price, required this.description, required this.image,required this.rating});

  factory productModel.fromJson(jsonData)
  {
    return productModel(id: jsonData['id'], title: jsonData['title'], price: (jsonData['price'] as num).toDouble(), description: jsonData['description'], image: jsonData['image'],rating: ratingModel.fromJson(jsonData['rating']));
  }

}
