import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CartViewBody(email: email),
    );
  }
}
