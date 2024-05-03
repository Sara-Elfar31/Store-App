class ratingModel
{
  final double rate ;
  final int count ;

  ratingModel({required this.rate, required this.count});
  
  factory ratingModel.fromJson(jsonData)
  {
    return ratingModel(rate: (jsonData['rate'] as num).toDouble(), count: jsonData['count']);
  }
}

