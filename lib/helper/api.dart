
import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{

  Future<dynamic> get({required String url }) async
  {
   http.Response response = 
        await http.get(Uri.parse(url));
     

  if(response.statusCode==200)
  {
  var jsonData = jsonDecode(response.body);
    return response;
  }
  else
  {
   throw Exception('there is proplem ${response.statusCode}');
  }
  }
}