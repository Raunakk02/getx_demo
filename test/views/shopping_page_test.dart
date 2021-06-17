import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:online_shopee/main.dart';

Widget shoppingPage;

void main() {
  setUp(() {
    shoppingPage = MyApp();
  });

  group('shopping page tests', () {
    // setUp(() {
    //   Get.testMode = true;
    // });
    testWidgets(
      'should load shopping page',
      (WidgetTester tester) async {
        // act
        await tester.pumpWidget(shoppingPage);

        // assert
        expect(find.byKey(ValueKey('shopping_page_scaffold')), findsOneWidget);
        expect(find.byKey(ValueKey('shopping_page_listview')), findsOneWidget);
        expect(find.byKey(ValueKey('shopping_page_fab')), findsOneWidget);
      },
    );

    testWidgets(
      'should check initial values on shopping page',
      (WidgetTester tester) async {
        // act
        await tester.pumpWidget(shoppingPage);
        await tester.pumpAndSettle();

        // assert
        // check total amount in cart
        expect(find.text('Total amount: \$ 0.0'), findsOneWidget);
        // check number of items in cart on FAB
        expect(find.text('0'), findsOneWidget);
        // check number of product cards on listview
        expect(find.byType(Card), findsWidgets);
      },
    );

    testWidgets(
      'should check updated values on shopping page',
      (WidgetTester tester) async {
        // arrange
        await tester.pumpWidget(shoppingPage);
        final buyButton = find.byType(RaisedButton).first;
        expect(buyButton, findsOneWidget);

        // act
        await tester.tap(buyButton);
        await tester.pumpAndSettle();

        // assert
        // check total amount in cart to be equal to price of first product
        expect(find.text('Total amount: \$ 30.0'), findsOneWidget);
        // check number of items in cart on FAB
        expect(find.text('1'), findsOneWidget);
      },
    );

    testWidgets(
      'should go to cart page on tapping FAB',
      (WidgetTester tester) async {
        // arrange
        await tester.pumpWidget(shoppingPage);
        final cartButton = find.byKey(ValueKey('shopping_page_fab'));
        expect(cartButton, findsOneWidget);

        // act
        await tester.tap(cartButton);
        await tester.pumpAndSettle();

        // assert
        //expect cart page to appear
        expect(find.byKey(ValueKey('cart_page_scaffold')), findsOneWidget);
      },
    );
  });
}
