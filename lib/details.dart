import 'package:bookapp/models/books_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Book book;

  const DetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          book.title.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  book.image.toString(),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Title: ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Text(
                  book.title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Author: ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Text(
                  book.authors.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Download: ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Text(
                  book.url.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
