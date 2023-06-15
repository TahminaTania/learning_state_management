// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:learning_sm/fetchData/Model.dart';

// class UserRepository {
//   String userUrl = 'https://jsonplaceholder.typicode.com/todos';

//   Future<List<UserModel>> gettodo() async {
//     Response response = await get(Uri.parse(userUrl));

//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body);
//       return result.map((e) => UserModel.fromJson(e)).toList();
//     } else {
//       throw "Something went wrong code ${response.statusCode}";
//     }
//   }
// }

import 'dart:convert';

import 'package:learning_sm/fetchData/Model.dart';
import 'package:learning_sm/fetchData/curd/remote.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository {
  final String apiEndpoint;

  Repository(this.apiEndpoint);

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse('$apiEndpoint/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> todoData = json.decode(response.body);
      return todoData.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }

  Future<void> createTodo(TodoModel todo) async {
    final response = await http.post(
      Uri.parse('$apiEndpoint/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create todo');
    }
  }

  Future<void> deleteTodoById(int id) async {
    final response = await http.delete(Uri.parse('$apiEndpoint/todos/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<void> updateTodoById(TodoModel todo) async {
    final response = await http.put(
      Uri.parse('$apiEndpoint/todos/${todo.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update todo');
    }
  }
}
