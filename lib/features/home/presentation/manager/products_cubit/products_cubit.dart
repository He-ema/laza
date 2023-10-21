import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/constants.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
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

      _product.snapshots().listen((event) {
        for (var doc in event.docs) {
          tempList.add(ProductModel.fromJson(doc));
        }
      });
      emit(ProductsSuccess(products: tempList));
    } catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
