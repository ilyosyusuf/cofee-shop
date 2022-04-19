import 'package:coffeeshop/screens/admin/admin_page.dart';
import 'package:coffeeshop/screens/cart_page.dart';
import 'package:coffeeshop/screens/login_page.dart';
import 'package:coffeeshop/screens/my_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: ((context) => MyHomePage()));
      case '/login':
        return MaterialPageRoute(builder: ((context) => LoginPage()));
      case '/cart':
        return MaterialPageRoute(builder: ((context) => CartPage()));
      case '/admin':
        return MaterialPageRoute(builder: ((context) => AdminPage()));
    }
  }
}
