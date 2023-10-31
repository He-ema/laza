import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  List<ProductModel> tempList = [];
  Future<void> getAllProducts() async {
    emit(ProductsLoading());

    try {
      CollectionReference _product =
          FirebaseFirestore.instance.collection(kProductsCollectionReference);

      var data = await _product.orderBy(kPrice).get();
      for (var element in data.docs) {
        tempList.add(ProductModel.fromJson(element));
      }
      emit(ProductsSuccess(products: tempList));
    } catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
