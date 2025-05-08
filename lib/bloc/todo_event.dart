part of 'todo_bloc.dart';

sealed class TodoEvent {}

final class TodoEventAdd extends TodoEvent {
  final String title;
  final DateTime date;
  TodoEventAdd({
    required this.title,
    required this.date
  });
}
