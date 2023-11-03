import 'package:flutter/material.dart';
import 'package:laza/features/payment/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PaymentViewBody(email: email),
    );
  }
}
