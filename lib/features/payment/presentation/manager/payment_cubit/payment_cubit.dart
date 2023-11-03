import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/features/payment/data/payment_model/payment_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  List<PaymentModel> tempList = [];

  Future<void> getPaymentData({required String email}) async {
    emit(PaymentLoading());

    try {
      CollectionReference _product =
          FirebaseFirestore.instance.collection(email + 'pay');

      var data = await _product.orderBy(kTime).get();
      for (var element in data.docs) {
        tempList.add(PaymentModel.fromJson(element));
      }
      emit(PaymentSuccess(tempList));
    } catch (e) {
      emit(PaymentFailure(e.toString()));
      print(e.toString());
    }
  }
}
