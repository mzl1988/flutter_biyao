import 'package:flutter/material.dart';
import '../pages/login_page/login_page.dart';
import '../pages/main_tabs/main_tabs.dart';
import '../pages/home_page/home_page.dart';

final routes = {
  '/': (context, {arguments}) => checkLogin(),
  '/login': (context, {arguments}) => LoginPage(),
  '/home': (context, {arguments}) => HomePage(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContextBuilder = routes[name];
  if (pageContextBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContextBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContextBuilder(context));
      return route;
    }
  }
};

Widget Function() checkLogin = () {
  return MainTabs();
};
