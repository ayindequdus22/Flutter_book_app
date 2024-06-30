import 'dart:math';

import 'package:bookapp/controllers/book_controller.dart';
import 'package:bookapp/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreePage extends StatefulWidget {
  const FreePage({super.key});

  @override
  State<FreePage> createState() => _FreePageState();
}

class _FreePageState extends State<FreePage> {
  late final BookController _bookController;

  @override
  void initState() {
    _bookController = Get.put(BookController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 10, bottom: 10),
          child: Text(
            "Free Books",
            style: TextStyle(fontSize: 30),
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: GetBuilder(
                init: _bookController,
                builder: (controller) {
                  return RefreshIndicator(
                    onRefresh: () => controller.getAllBooks(),
                    child: Column(
                      children: [
                        GetBuilder<BookController>(
                          init: _bookController,
                          builder: (controller) {
                            int numberOfElements =
                                10; // Change this value to the desired number of elements
                            List randomElements = [];

                            for (int i = 0; i < numberOfElements; i++) {
                              int randomIndex =
                                  Random().nextInt(controller.books.length);
                              randomElements.add(controller.books[randomIndex]);
                            }
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
                                    itemCount: randomElements.length,
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
                                              image: NetworkImage(controller
                                                      .books[index].image ??
                                                  ''),
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
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
