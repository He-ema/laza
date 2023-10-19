part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserFailure extends UserState {
  final String errorMessage;

  UserFailure(this.errorMessage);
}

final class UserSuccess extends UserState {
  final UserModel user;

  UserSuccess(this.user);
}
