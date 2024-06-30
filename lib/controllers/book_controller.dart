import 'dart:convert';

import 'package:bookapp/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookController extends GetxController {
  bool isLoading = false;
  var books = <Book>[];

  void load() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = !isLoading;
      refresh();
    });
  }

  @override
  void onInit() async {
    getAllBooks();
    super.onInit();
  }

  Future<String> getAllBooks() async {
    try {
      load();
      var response = await http.get(
        Uri.parse('https://www.dbooks.org/api/recent'),
      );
      if (json.decode(response.body)['status'] == 'ok') {
        print("books: ${json.decode(response.body)['books']}");
        var content = json.decode(response.body)['books'];
        for (var item in content) {
          books.add(Book.fromJson(item));
        }
        load();
        return "Success";
      } else {
        print(json.decode(response.body));
        load();
        return json.decode(response.body).toString();
      }
    } catch (e) {
      print(e.toString());
      load();
      return "Something went wrong";
    }
  }

  Future<String> searchBook(String query) async {
    try {
      var response = await http.get(
        Uri.parse('https://www.dbooks.org/api/search/$query'),
      );
      if (json.decode(response.body)['status'] == 'ok') {
        print("books: ${json.decode(response.body)['books']}");
        var content = json.decode(response.body)['books'];
        for (var item in content) {
          books.add(Book.fromJson(item));
        }
        load();
        return "Success";
      } else {
        print(json.decode(response.body));
        load();
        return json.decode(response.body).toString();
      }
    } catch (e) {
      print(e.toString());
      load();
      return "Something went wrong";
    }
  }
}
