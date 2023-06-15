// part of 'fetchdata_cubit.dart';

// abstract class FetchdataState extends Equatable {
//   const FetchdataState();

//   @override
//   List<Object> get props => [];
// }

// class FetchdataInitial extends FetchdataState {}

// class dataLoadingState extends FetchdataState {
//   // @override
//   // List<Object?> get props => [];
// }

// class dataLoadedState extends FetchdataState {
//   final List<UserModel> todos;
//   dataLoadedState(this.todos);

//   // @override
//   // List<Object?> get props => [todos];
// }

// class dataErrorState extends FetchdataState {
//   final String error;
//   dataErrorState(this.error);
//   // @override
//   // List<Object?> get props => [error];
// }

import 'package:learning_sm/fetchData/Model.dart';

abstract class DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final List<TodoModel> todos;

  DataLoadedState(this.todos);
}

class DataErrorState extends DataState {
  final String errorMessage;

  DataErrorState(this.errorMessage);
}
