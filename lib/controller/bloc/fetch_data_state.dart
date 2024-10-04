part of 'fetch_data_bloc.dart';

@immutable
sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}

class Successfetch extends FetchDataState {
final MediaList fetchdata;

  Successfetch({required this.fetchdata});
}

class Failurefetch extends FetchDataState {
  final String? message;

  Failurefetch(this.message);
}

class Loadingfetch extends FetchDataState {}
