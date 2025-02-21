sealed class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String title;

  AddTaskEvent(this.title);
}

class RemoveTaskEvent extends TaskEvent {
  final String id;

  RemoveTaskEvent(this.id);
}

class ToggleTaskEvent extends TaskEvent {
  final String id;

  ToggleTaskEvent(this.id);
}
