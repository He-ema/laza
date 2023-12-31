import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import '../../../../constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool signedWithGoogle = true;
  bool verified = false;
  String? email;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection(kUsersCollectionReference);

  Future<void> signUpwithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await createUser(
        email: email,
        name: name,
        verified: false,
      );
      this.email = email;
      signedWithGoogle = false;
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(
            erroHeader: 'Weak Password',
            errorMessage: 'This Password is Too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(
            erroHeader: 'Email Already exists',
            errorMessage: 'This email is already used'));
      }
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      this.email = email;
      signedWithGoogle = false;
      var data = await _users.doc(email).get();
      verified = data[kVerified];

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(
            erroHeader: 'User not found',
            errorMessage: 'The Email You entered doesn\'t match a user'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(
            erroHeader: 'Wrong password',
            errorMessage: 'This password is wrong'));
      }
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  dynamic signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var doc = _users.doc(googleUser!.email);
      await doc.get().then((doc) async {
        if (doc.exists) {
        } else {
          await createUser(
            email: googleUser.email,
            name: googleUser.displayName!,
            image: googleUser.photoUrl,
            verified: true,
          );
        }
      });
      email = googleUser.email;
      signedWithGoogle = true;

      emit(AuthSuccess());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('The error is ');
      print(e.toString());
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Something went wrong , try again'));
    }
  }

  Future<void> createUser({
    required String email,
    required String name,
    required bool verified,
    @required String? image,
  }) async {
    emit(AuthLoading());
    try {
      await _users.doc(email).set({
        kName: name,
        kEmail: email,
        kImage: image ??
            'https://firebasestorage.googleapis.com/v0/b/laza-67c82.appspot.com/o/avatar.png?alt=media&token=66c5e6ad-cde2-4b17-87d8-1847447d5451&_gl=1*1l219v*_ga*MjA0OTY2NzM3OS4xNjg4MzE3OTUw*_ga_CW55HF8NVT*MTY5NzE5ODkzMy4xNTUuMS4xNjk3MjAxMDkyLjQ1LjAuMA..',
        kVerified: verified,
      });
    } catch (e) {
      emit(AuthFailure(
          erroHeader: 'Error',
          errorMessage: 'Error creating user , try again'));
    }
  }
}
