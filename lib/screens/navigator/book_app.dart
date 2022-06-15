import 'package:flutter/material.dart';

import '../../models/navigator/book.dart';
import 'book_detail_page.dart';
import 'book_list_screen.dart';

class BookAppPages extends StatefulWidget {
  const BookAppPages({Key? key}) : super(key: key);
static const String url="BOOK_APP";
  @override
  State<BookAppPages> createState() => _BookAppPagesState();
}

class _BookAppPagesState extends State<BookAppPages> {
   Book? _selectedBook;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key:const ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (_selectedBook != null) BookDetailsPage(book: _selectedBook!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

   void _handleBookTapped(Book book) {
     setState(() {
       _selectedBook = book;
     });
   }
}
