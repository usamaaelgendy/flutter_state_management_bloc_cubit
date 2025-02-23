import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc_cubit/controllers/task_bloc.dart';
import 'package:flutter_state_management_bloc_cubit/controllers/task_event.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => TaskBloc(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final controllerCubit = context.read<TaskBloc>();
            return Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter a task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isEmpty) return;
                    controllerCubit.add(AddTaskEvent(controller.text));
                    controller.clear();
                  },
                  child: const Text("Add Task"),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        state.tasksList[index].title,
                      ),
                      leading: Checkbox(
                        value: state.tasksList[index].isCompleted,
                        onChanged: (value) {
                          controllerCubit.add(ToggleTaskEvent(state.tasksList[index].id));
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          controllerCubit.add(RemoveTaskEvent(state.tasksList[index].id));
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
