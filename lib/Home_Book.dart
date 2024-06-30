import 'dart:math';

import 'package:bookapp/controllers/book_controller.dart';
import 'package:bookapp/details.dart';
import 'package:bookapp/models/books_model.dart';
import 'package:bookapp/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBook extends StatefulWidget {
  const HomeBook({super.key});

  @override
  State<HomeBook> createState() => _HomeBookState();
}

class _HomeBookState extends State<HomeBook> {
  @override
  late final BookController _bookController;

  late final TextEditingController _searchController;

  @override
  void initState() {
    _bookController = Get.put(BookController());
    _searchController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFF1f1545),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _searchController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    onPressed: () => Get.to(
                      () => SearchPage(query: _searchController.text),
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<BookController>(
              init: _bookController,
              builder: (controller) {
                return controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 3,
                        ),
                        itemCount: controller.books.take(5).length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.to(
                              () => DetailsPage(
                                book: controller.books[index],
                              ),
                            ),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      controller.books[index].image ?? ''),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
