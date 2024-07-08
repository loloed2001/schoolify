import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myshop/Features/Students/LoginStudent/data/models/auth_models.dart';

class AuthDataSource {
  Future<Authmodel?> login(String email, String password) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    final result = await http.post(
        Uri.parse("http://www.marahschool.somee.com/api/Students/SignIn"),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });
    print(result.statusCode);
    print(result.body);
    if (result.statusCode == 200) {
      return authmodelFromJson(result.body);
    }
    return null;
  }
}
