part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errorMessage;

  PaymentFailure(this.errorMessage);
}

final class PaymentSuccess extends PaymentState {
  final List<PaymentModel> payments;

  PaymentSuccess(this.payments);
}
