import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:meridian_mechine_test/model/Datamodel.dart';
import 'package:meridian_mechine_test/utils/api_repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(FetchDataInitial()) {
    on<Fetchlist>(fetchlists);
  }
  Apirepository apirepository = Apirepository();

  FutureOr<void> fetchlists(
      Fetchlist event, Emitter<FetchDataState> emit) async {
    emit(Loadingfetch());
    late MediaList fetchdatas;
    try {
      final Response response = await apirepository.homescreenRepository();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        fetchdatas = MediaList.fromJson(result);

        emit(Successfetch(fetchdata: fetchdatas));
      } else {
        emit(Failurefetch("somthing went wrong"));
      }
    } catch (e) {
      emit(Failurefetch(e.toString()));
    }
  }
}
