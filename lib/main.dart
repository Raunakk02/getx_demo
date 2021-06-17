import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/cart_page.dart';
import './views/shopping_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case CartPage.routeName:
            return MaterialPageRoute(builder: (_) => CartPage());
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Text("No route defined for ${settings.name}"),
                    ));
        }
      },
    );
  }
}
