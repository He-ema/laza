import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:laza/core/stripe_payment/stripe_keys.dart';

abstract class PaymentManager {
  static Future<bool> makePayment(
      int amount, String currency, BuildContext context) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);

      await initializePaymentSheet(clientSecret, context);

      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      print('error');
      return false;
    }
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();

    var response = await dio.post('https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        });

    return response.data['client_secret'];
  }

  static Future<void> initializePaymentSheet(
      String clientSecret, BuildContext context) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
        background: Theme.of(context).colorScheme.background,
        componentBackground: Theme.of(context).colorScheme.primary,
        componentText: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        error: Colors.red,
        icon: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        placeholderText: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.grey,
      )),
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: 'Ibrahim Osama',
    ));
  }

  // static Future<bool> successfullyPaid(String clientSecret) async {
  //   var paymentIntent =
  //       await Stripe.instance.retrievePaymentIntent(clientSecret);
  //   if (paymentIntent.status == 'succeeded') {
  //     print('yes');
  //     return true;
  //   } else {
  //     print('no');
  //     return false;
  //   }
  // }
}
