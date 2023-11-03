import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:laza/features/payment/presentation/views/widgets/payment_list_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kTopSpace,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payments',
              style: Styles.textstyle22,
            ),
          ],
        ),
        const Divider(
          height: 40,
          endIndent: 50,
          indent: 50,
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
          child: PaymentListView(email: email),
        ),
      ],
    );
  }
}
