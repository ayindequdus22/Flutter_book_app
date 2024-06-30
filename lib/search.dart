import 'package:bookapp/controllers/book_controller.dart';
import 'package:bookapp/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.query});

  final String query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final BookController _bookController;

  @override
  void initState() {
    _bookController = Get.put(BookController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bookController.searchBook(widget.query);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
                          itemCount: controller.books.length,
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
      ),
    );
  }
}
