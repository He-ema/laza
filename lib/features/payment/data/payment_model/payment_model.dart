import 'package:laza/constants.dart';

class PaymentModel {
  final String date;
  final int total;

  PaymentModel({required this.date, required this.total});

  factory PaymentModel.fromJson(jsonData) {
    return PaymentModel(date: jsonData[kTime], total: jsonData[kTotal]);
  }
}
