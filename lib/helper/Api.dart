import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api
{
  Future <http.Response> get ({required String url , @required String? tokens}) async
  {
    Map <String , String> headers = {} ;
    if(tokens != null)
    {
      headers.addAll({
        'Authorization ' : 'Bearer $tokens'
      });
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if(response.statusCode ==200)
      {
        return response ;
      }
    else
      {
        throw Exception('There Is A problem With Status Code${response.statusCode}');
      }
  }

  Future <dynamic> post ({required String url , @required dynamic body , @required String? tokens }) async
  {
    Map <String , String> headers = {} ;
    if(tokens != null)
      {
        headers.addAll({
          'Authorization ' : 'Bearer $tokens'
        });
      }
   http.Response response = await  http.post(Uri.parse(url) , body: body , headers: headers);
      if (response.statusCode==200) {
        Map <String , dynamic> data= jsonDecode(response.body);
        print(data);
        return data ;
      }
      else
        {
          throw Exception(jsonDecode(response.body)) ;
        }
  }

  Future <dynamic> put ({required String url , @required dynamic body , @required String? tokens }) async
  {
    Map <String , String> headers = {} ;
    headers.addAll({
      'Content-Type' : 'application/x-www-form-urlencoded'
    });

    if(tokens != null)
    {
      headers.addAll({
        'Authorization ' : 'Bearer $tokens'
      });
    }
    print('url $url  body $body  token$tokens');
    http.Response response = await  http.post(Uri.parse(url) , body: body , headers: headers);
    if (response.statusCode==200) {
      Map <String , dynamic> data= jsonDecode(response.body);
      print(data);
      return data ;
    }
    else
    {
      throw Exception(jsonDecode(response.body)) ;
    }
  }


}