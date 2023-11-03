import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:laza/features/payment/data/payment_model/payment_model.dart';

import '../../../../../core/utils/styles.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
    required this.index,
    required this.startAnimation,
    required this.paymentModel,
  });
  final PaymentModel paymentModel;
  final int index;
  final bool startAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 250)),
      decoration: BoxDecoration(
        color: Colors.greenAccent[700],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
          bottom: 20, left: kHorizontalPadding, right: kHorizontalPadding),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '    State : ',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
              Text(
                'Success',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Amount : ',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
              Text(
                paymentModel.total.toString(),
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '     Date : ',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
              Text(
                '${paymentModel.date.toDate().day}/${paymentModel.date.toDate().month}/${paymentModel.date.toDate().year}',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '     Time : ',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
              Text(
                '    ${paymentModel.date.toDate().hour < 10 ? '0${paymentModel.date.toDate().hour}' : paymentModel.date.toDate().hour.toString()}: ${paymentModel.date.toDate().minute}  ',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
