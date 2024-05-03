import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store_app/screens/homePage.dart';
import 'package:store_app/screens/updateProduct.dart';

void main() {
  runApp(MaterialApp(
    routes:{
      'homePage' : (context) => const homePage(),
      'updateProduct' : (context) => updateProductPage()
    } ,
    debugShowCheckedModeBanner: false,
    home: const homePage(),
  ));
}