import 'package:flutter/material.dart';

class PaymentListView extends StatelessWidget {
  const PaymentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(),
    ));
  }
}
