import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  final String id;
  final String title;
  final bool isCompleted;

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }



  @override
  List<Object?> get props => [id, title, isCompleted];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }
}
