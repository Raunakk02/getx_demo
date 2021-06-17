import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../../lib/controllers/shopping_controller.dart';

ShoppingController shoppingController;

void main() {
  setUp(() {
    shoppingController = Get.put(ShoppingController());
  });
  group('shopping controller test', () {
    test(
      'should check products list is not empty',
      () async {
        expect(shoppingController.initialized, true);
        expect(shoppingController.products.length, 3);
      },
    );
  });
}
