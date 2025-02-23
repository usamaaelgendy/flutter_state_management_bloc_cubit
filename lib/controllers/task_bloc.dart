import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_state_management_bloc_cubit/controllers/task_event.dart';
import 'package:flutter_state_management_bloc_cubit/models/task_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);

    on<RemoveTaskEvent>(_removeTask);

    on<ToggleTaskEvent>(_toggleTask);
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final model = TaskModel(id: const Uuid().v4(), title: event.title, isCompleted: false);
    emit(UpdateTask([...state.tasksList, model]));
  }

  FutureOr<void> _removeTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    final List<TaskModel> newList = state.tasksList.where((task) => task.id != event.id).toList();
    emit(UpdateTask(newList));
  }

  FutureOr<void> _toggleTask(ToggleTaskEvent event, Emitter<TaskState> emit) {
    final List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == event.id ? task.copyWith(isCompleted: !task.isCompleted) : task;
    }).toList();

    emit(UpdateTask(newList));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return UpdateTask((json['todoList'] as List<dynamic>).map((e) => TaskModel.fromJson(e)).toList());
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return {"todoList": state.tasksList.map((todo) => todo.toJson()).toList()};
  }
}
