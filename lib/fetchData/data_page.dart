// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning_sm/fetchData/cubit/fetchdata_cubit.dart';
// import 'package:learning_sm/fetchData/curd/add_data_page.dart';
// import 'package:learning_sm/fetchData/curd/edit_page.dart';
// import 'package:learning_sm/fetchData/single_data.dart';

// class DataPage extends StatefulWidget {
//   const DataPage({Key? key}) : super(key: key);

//   @override
//   State<DataPage> createState() => _DataPageState();
// }

// class _DataPageState extends State<DataPage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       final cubit = context.read<FetchdataCubit>();
//       cubit.fetchdata();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AddDataPage(),
//                 ));
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//       body: SafeArea(child: Container(
//         child: BlocBuilder<FetchdataCubit, FetchdataState>(
//           builder: (context, state) {
//             if (state is FetchdataInitial || state is dataLoadingState) {
//               return Container(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 100),
//                     SizedBox(
//                       child: CircularProgressIndicator(),
//                     ),
//                     SizedBox(
//                       child: Text(state.toString()),
//                     )
//                   ],
//                 ),
//               );
//             } else if (state is dataLoadedState) {
//               final datas = state.todos;
//               return ListView.builder(
//                   itemCount: datas.length,
//                   itemBuilder: (context, index) {
//                     final data = datas[index];
//                     return Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Text(data.title),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           SingleData(pass: data),
//                                     ),
//                                   );
//                                 },
//                                 child: Text("click")),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => EditPage(),
//                                     ),
//                                   );
//                                 },
//                                 child: Text("Edit"))
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             } else if (state is dataErrorState) {
//               return Text(state.error);
//             }
//             return Text(state.toString());
//           },
//         ),
//       )),
//     );
//   }
// }

// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     final cubit = context.read<DataCubit>();
//     cubit.fetchTodos();
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/fetchData/Model.dart';

import 'package:learning_sm/fetchData/cubit/fetchdata_cubit.dart';
import 'package:learning_sm/fetchData/cubit/fetchdata_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadedState) {
            final todos = state.todos;

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(
                  title: Text(todo.title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<DataCubit>().deleteTodoById(todo.id);
                    },
                  ),
                );
              },
            );
          } else if (state is DataErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddTodoDialog(context);
        },
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';

        return AlertDialog(
          title: Text('Add Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final todo = TodoModel(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: title,
                  completed: false,
                );
                context.read<DataCubit>().createTodo(todo);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
