part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final bool exists;

  DetailsSuccess(this.exists);
}

final class DetailsFailure extends DetailsState {
  final String errorMessage;

  DetailsFailure(this.errorMessage);
}

final class DetailsLoading extends DetailsState {}
