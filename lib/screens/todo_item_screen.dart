import 'package:flutter/material.dart';
import 'package:todo_app/store/todos_state.dart';

import '../config/palette.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class TodoItemScreen extends StatefulWidget {
  final Todo? todo;
  final bool isAdding;
  const TodoItemScreen({Key? key, this.todo, this.isAdding = false})
      : super(key: key);

  @override
  State<TodoItemScreen> createState() => _TodoItemScreenState();
}

class _TodoItemScreenState extends State<TodoItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final todosState = TodosState();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    // This onSave method is adding new Todo or updating the current Todo, also is validating the title input, which cannot be empty
    onSave() {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      String newTitle =
          widget.todo != null && title.isEmpty ? widget.todo!.title : title;
      String? newDesc = description.trim().isNotEmpty ? description : null;
      widget.todo != null
          ? todosState.updateTodo(widget.todo!.id, newTitle, newDesc, null)
          : todosState.addTodo(title, description);
      Navigator.pop(context);
    }

    onUpdateCompleted() {
      todosState.updateTodo(
          widget.todo!.id, null, null, !widget.todo!.isCompleted);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdding ? 'Add Todo' : 'Todo Item'),
        backgroundColor: Palette.scaffold,
        // Here we are checking to see if Todo is completed or not, to show the correct action,
        actions: [
          !widget.isAdding
              ? CreateAction(
                  color: widget.todo!.isCompleted ? Colors.red : Colors.green,
                  title: widget.todo!.isCompleted
                      ? 'Mark as \nuncompleted'
                      : 'Mark as \ncompleted',
                  onPressed: onUpdateCompleted,
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            // Title input
            TextFormField(
              validator: (title) {
                if (title!.trim().isEmpty) {
                  return 'The title can\'t be empty';
                }
                return null;
              },
              onChanged: (text) => setState(() => title = text),
              initialValue: widget.todo?.title ?? '',
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 40),
            // Description input
            TextFormField(
              onChanged: (desc) => setState(() => description = desc),
              maxLines: 3,
              initialValue: widget.todo?.description ?? '',
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Description",
              ),
            ),
            const SizedBox(height: 20),
            // The button which adding or updating todos
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSave,
                child: Text(
                  widget.isAdding ? 'Add' : 'Save',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
