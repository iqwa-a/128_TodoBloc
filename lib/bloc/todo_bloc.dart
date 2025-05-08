import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoaded(todos: [], selectedDate: null)) {
    on<TodoEventAdd>((event, emit) {
      final currentstate = state;
      if (currentstate is TodoLoaded) {
        final List<Todo> updateTodos = List.from(currentstate.todos);
        updateTodos.add(
          Todo(
            title: event.title, 
            date: event.date, 
            isComplete: false)
        );
        emit(
          TodoLoaded(
            todos: updateTodos, 
            selectedDate: currentstate.selectedDate)
        );
      }
    });
    on<TodoSelectedDate>((event, emit) {
      final currentstate = state;
      if (currentstate is TodoLoaded){
        emit(TodoLoaded(
          todos: currentstate.todos, 
          selectedDate: event.date)
        );
      }
    });
  }
}

