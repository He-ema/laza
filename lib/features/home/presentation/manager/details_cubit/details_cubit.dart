import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  Future<bool> checkExists(
      {required String name, required String email}) async {
    emit(DetailsLoading());
    try {
      bool exists = false;
      CollectionReference userFavourite = FirebaseFirestore.instance
          .collection(email + kFavouriteCollectionReference);

      var doc = userFavourite.doc(name);
      await doc.get().then((doc) async {
        if (doc.exists) {
          exists = true;
        }
      });

      emit(DetailsSuccess(exists));
      return exists;
    } catch (e) {
      emit(DetailsFailure(e.toString()));
      return false;
    }
  }

  Future<void> handleAddingAndDeletionOfProduct(
      {required String email, required ProductModel product}) async {
    emit(DetailsLoading());
    try {
      CollectionReference userFavourite = FirebaseFirestore.instance
          .collection(email + kFavouriteCollectionReference);
      var data = await userFavourite.doc(product.name).get().then((doc) {
        if (doc.exists) {
          userFavourite.doc(product.name).delete();
          emit(DetailsSuccess(false));
        } else {
          userFavourite.doc(product.name).set(
            {
              kName: product.name,
              kImage: product.image,
              kPrice: product.price,
              kDescription: product.description,
              kQuantity: 1,
              kTime: DateTime.now(),
            },
          );
          emit(DetailsSuccess(true));
        }
      });
    } catch (e) {
      emit(DetailsFailure(e.toString()));
    }
  }
}
