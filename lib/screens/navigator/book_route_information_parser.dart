import 'package:flutter/material.dart';
import 'package:training/screens/navigator/book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");
    print("PATH : ${uri.path}");
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return BookRoutePath.home();
    }

    // Handle '/book/:id'

    if (uri.pathSegments.length >= 2) {
      if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    // Handle unknown routes
    return BookRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    print("RestoreRoutePath : Detail${path.isDetailsPage}, HomePage: ${path.isHomePage},BookId  : ${path.id}, Unknown ${path.isUnknown}");
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }

    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return RouteInformation(location: '/404');
  }
}
