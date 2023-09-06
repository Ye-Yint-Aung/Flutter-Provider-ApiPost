import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService {
  final String url = "https://jsonplaceholder.typicode.com/albums";

  getUser() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userList = data.map((jsondata) {
          User user = User.fromJson(jsondata);
          return user;
        }).toList();
        return userList;
        //print("Hello : ${userList[0].title}");
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  postUser(String title, int userId) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          'title': title,
        }),
      );
      if (response.statusCode == 201) {
        print("Success");
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create User.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
