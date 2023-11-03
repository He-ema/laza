import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/constants.dart';

class PaymentModel {
  final Timestamp date;
  final int total;

  PaymentModel({required this.date, required this.total});

  factory PaymentModel.fromJson(jsonData) {
    return PaymentModel(date: jsonData[kTime], total: jsonData[kTotal]);
  }
}
