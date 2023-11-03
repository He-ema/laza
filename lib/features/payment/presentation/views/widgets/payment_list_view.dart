import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/utils/widgets/product_container.dart';
import 'package:laza/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:laza/features/payment/presentation/views/widgets/payment_container.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/skelton.dart';

class PaymentListView extends StatefulWidget {
  const PaymentListView({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<PaymentListView> createState() => _PaymentListViewState();
}

class _PaymentListViewState extends State<PaymentListView> {
  bool startAnimation = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PaymentCubit>(context).getPaymentData(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        if (state is PaymentSuccess) {
          if (state.payments.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/images/empty.json',
                  // width: 200,
                  // height: 200,
                  fit: BoxFit.fill,
                ),
                const Text(
                  'You haven\'t made any payments ',
                  style: Styles.textstyle28,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                startAnimation = true;
              });
            });
            return Expanded(
                child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.payments.length,
              itemBuilder: (context, index) => PaymentContainer(
                  paymentModel: state.payments[index],
                  startAnimation: startAnimation,
                  index: index),
            ));
          }
        } else if (state is PaymentFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 20,
                    left: kHorizontalPadding,
                    right: kHorizontalPadding),
                child: Skelton(
                  width: double.infinity,
                  height: 150,
                  opacity: 0.1,
                  borderRaduis: 15,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
