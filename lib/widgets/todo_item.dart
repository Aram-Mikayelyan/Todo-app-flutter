import 'package:flutter/material.dart';
import 'package:todo_app/config/palette.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function() deleteTodo;
  final String index;
  const TodoItem(
      {Key? key,
      required this.todo,
      required this.index,
      required this.deleteTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is routing to TodoItem screen, where the user can edit Todos
    _routeToTodoItem() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TodoItemScreen(todo: todo)),
      );
    }

    return Stack(children: [
      ListTile(
        tileColor: Palette.scaffold,
        contentPadding: const EdgeInsets.fromLTRB(6.0, 10, 6, 10),
        title: Text(
          todo.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: Container(
          height: 67,
          width: 67,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white10,
          ),
          child: Center(
              child: Text(
            index,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
        subtitle: Text(
          todo.description ?? '',
          style: const TextStyle(
              overflow: TextOverflow.ellipsis, color: Colors.grey),
        ),
        // This part is the right side of TodoItem with 2 iconButtons,
        //deleting and editing single Todos
        trailing: SizedBox(
          width: 100,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.edit, size: 30.0, color: Colors.grey),
              onPressed: _routeToTodoItem,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.delete, size: 30.0, color: Colors.grey),
              onPressed: deleteTodo,
            ),
          ]),
        ),
        // iconColor: Colors.grey,s
      ),
      todo.isCompleted
          ? const Positioned(
              left: 7,
              top: 7,
              child: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.green,
                size: 34,
              ))
          : const SizedBox.shrink()
    ]);
  }
}
