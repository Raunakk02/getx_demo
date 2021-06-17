import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey('cart_page_scaffold'),
    );
  }
}
