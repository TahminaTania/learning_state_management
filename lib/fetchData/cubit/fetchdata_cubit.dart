// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:learning_sm/fetchData/Model.dart';
// import 'package:learning_sm/fetchData/repo.dart';

// part 'fetchdata_state.dart';

// class FetchdataCubit extends Cubit<FetchdataState> {
//   final UserRepository _repository;
//   FetchdataCubit(this._repository) : super(FetchdataInitial());

//   Future<void> fetchdata() async {
//     emit(dataLoadingState());
//     await Future.delayed(Duration(seconds: 2));
//     try {
//       final response = await _repository.gettodo();
//       emit(dataLoadedState(response));
//     } catch (e) {
//       emit(dataErrorState(e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/fetchData/Model.dart';
import 'package:learning_sm/fetchData/cubit/fetchdata_state.dart';
import 'package:learning_sm/fetchData/repo.dart';

class DataCubit extends Cubit<DataState> {
  final Repository repository;

  DataCubit(this.repository) : super(DataLoadingState());

  Future<void> fetchTodos() async {
    try {
      final todos = await repository.fetchTodos();
      emit(DataLoadedState(todos));
    } catch (e) {
      emit(DataErrorState('Failed to fetch todos'));
    }
  }

  Future<void> createTodo(TodoModel todo) async {
    try {
      await repository.createTodo(todo);
      emit(DataLoadingState());
      final todos = await repository.fetchTodos();
      emit(DataLoadedState(todos));
    } catch (e) {
      emit(DataErrorState('Failed to create todo'));
    }
  }

  Future<void> deleteTodoById(int id) async {
    try {
      await repository.deleteTodoById(id);
      emit(DataLoadingState());
      final todos = await repository.fetchTodos();
      emit(DataLoadedState(todos));
    } catch (e) {
      emit(DataErrorState('Failed to delete todo'));
    }
  }

  Future<void> updateTodoById(TodoModel todo) async {
    try {
      await repository.updateTodoById(todo);
      emit(DataLoadingState());
      final todos = await repository.fetchTodos();
      emit(DataLoadedState(todos));
    } catch (e) {
      emit(DataErrorState('Failed to update todo'));
    }
  }
}
