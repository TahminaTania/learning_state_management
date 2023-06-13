import 'dart:convert';
import 'package:http/http.dart';
import 'package:learning_sm/fetchData/Model.dart';

class UserRepository {
  String userUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<UserModel>> gettodo() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
