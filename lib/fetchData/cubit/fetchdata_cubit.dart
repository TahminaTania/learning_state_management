import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_sm/fetchData/Model.dart';
import 'package:learning_sm/fetchData/repo.dart';

part 'fetchdata_state.dart';

class FetchdataCubit extends Cubit<FetchdataState> {
  final UserRepository _repository;
  FetchdataCubit(this._repository) : super(FetchdataInitial());

  Future<void> fetchdata() async {
    emit(dataLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await _repository.gettodo();
      emit(dataLoadedState(response));
    } catch (e) {
      emit(dataErrorState(e.toString()));
    }
  }
}
