import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../../lib/controllers/cart_controller.dart';
import '../../lib/models/product.dart';

CartController cartController;

void main() {
  setUp(() {
    cartController = Get.put(CartController());
  });
  group('cart controller test', () {
    test(
      'should check products list is empty',
      () async {
        expect(cartController.count, 0);
        expect(cartController.cartItems.isBlank, true);
        expect(cartController.totalPrice, 0.0);
      },
    );

    test(
      'should test addition of products',
      () async {
        // arrange
        final prod = Product(
          id: 1,
          price: 2.1,
          productDescription: 'test',
          productImage: 'test.png',
          productName: 'test prod',
        );

        // act
        cartController.addToCart(prod);

        // assert
        expect(cartController.count, 1);
        expect(cartController.cartItems.isBlank, false);
        expect(cartController.totalPrice, 2.1);
      },
    );
  });
}
