import 'package:flutter/material.dart';
import 'package:training/screens/navigator/book_route_information_parser.dart';
import 'package:training/screens/navigator/book_router_delegate.dart';

class BooksAppRouter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppRouterState();
}

class _BooksAppRouterState extends State<BooksAppRouter> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
  BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}