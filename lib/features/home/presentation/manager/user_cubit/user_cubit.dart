import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laza/features/home/data/user_model/user_model.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> getUserData(String email) async {
    emit(UserLoading());
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(kUsersCollectionReference);
      var data = await users.doc(email).get();
      emit(UserSuccess(UserModel.fromJson(data)));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
