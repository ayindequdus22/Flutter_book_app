import 'package:bookapp/FreePage.dart';
import 'package:bookapp/PaidPage.dart';
import 'package:bookapp/controllers/book_controller.dart';
import 'package:bookapp/details.dart';
import 'package:bookapp/models/books_model.dart';
import 'package:bookapp/search.dart';
import 'package:bookapp/home_book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final BookController _bookController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    _bookController = Get.put(BookController());
    _searchController = TextEditingController();
    super.initState();
  }

  final pages = [HomeBook(), FreePage(), PaidPage()];

  int currentIndex = 0;
  Color selectedItemColor = Color.fromARGB(255, 255, 16, 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        title: Center(
          child: Text(
            "Welcome to App Book",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1f1545),
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.indigoAccent,
        onTap: (cIndex) {
          setState(() {
            currentIndex = cIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? selectedItemColor : Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_outlined,
              color: currentIndex == 1 ? selectedItemColor : Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmarks_outlined,
              color: currentIndex == 2 ? selectedItemColor : Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
