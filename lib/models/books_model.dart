// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  List<Book>? books;

  BookModel({
    this.books,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        books: json["books"] == null
            ? []
            : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}

class Book {
  String? id;
  String? title;
  String? subtitle;
  String? authors;
  String? image;
  String? url;

  Book({
    this.id,
    this.title,
    this.subtitle,
    this.authors,
    this.image,
    this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "authors": authors,
        "image": image,
        "url": url,
      };
}
