import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future init() async {
  storage = await SharedPreferences.getInstance();
}

SharedPreferences storage;
const SERVER_IP = '46.53.100.37:8000';
const TOKEN_KEY = 'token';

class Account extends ChangeNotifier {
  bool get signedIn => storage.getString(TOKEN_KEY)?.isNotEmpty ?? false;

  Future<void> signIn(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://$SERVER_IP/api/v1/login'));
    request.body = jsonEncode({
      'email': email,
      'password': password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    try {
      var body = await response.stream.bytesToString();
      if (body != null) {
        var bodyJson = jsonDecode(body);
        if (bodyJson['success']) {
          await storage.setString(TOKEN_KEY, bodyJson['token']['token']);
          notifyListeners();
        }
      }
    } finally {}
  }

  Future register(String name, String email, String password) async {
    var headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://$SERVER_IP/api/v1/register'));
    request.body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    try {
      var body = await response.stream.bytesToString();
      if (body != null) {
        var bodyJson = jsonDecode(body);
        if (bodyJson['success']) {
          await storage.setString(TOKEN_KEY, bodyJson['token']['token']);
          notifyListeners();
        }
      }
    } finally {}
  }

  Future<void> signOut() async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('http://$SERVER_IP/api/v1/logout'));
    request.headers.addAll(headers);

    request.send();
    storage.setString(TOKEN_KEY, '');
    notifyListeners();
  }

  static Future getAllProducts() async {
    var response = await http.post(
      Uri.parse('http://$SERVER_IP/api/v1/register'),
    );
  }
}
