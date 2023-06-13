import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/fetchData/cubit/fetchdata_cubit.dart';
import 'package:learning_sm/fetchData/single_data.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<FetchdataCubit>();
      cubit.fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: BlocBuilder<FetchdataCubit, FetchdataState>(
          builder: (context, state) {
            if (state is FetchdataInitial || state is dataLoadingState) {
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    SizedBox(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      child: Text(state.toString()),
                    )
                  ],
                ),
              );
            } else if (state is dataLoadedState) {
              final datas = state.todos;
              return ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    final data = datas[index];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(data.title),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SingleData(pass: data),
                                    ),
                                  );
                                },
                                child: Text("click"))
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is dataErrorState) {
              return Text(state.error);
            }
            return Text(state.toString());
          },
        ),
      )),
    );
  }
}
