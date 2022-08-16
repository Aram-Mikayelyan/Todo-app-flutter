import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/palette.dart';
import '../models/models.dart';
import '../store/todos_state.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  final filterKey = GlobalKey<_CreateFilterSectionState>();
  final todosState = TodosState();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _routeToCreateTodo() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TodoItemScreen(
                  isAdding: true,
                )),
      );
      print(todosState.todos);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.scaffold,
            title: const Text(
              'Todos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            floating: true,

            // Here are actions to mark all Todos as completed or delete completed Todos

            actions: [
              CreateAction(
                onPressed: todosState.markAllAsCompleted,
                color: Colors.green,
                title: 'Mark all \nas completed',
              ),
              CreateAction(
                onPressed: todosState.deleteCompleted,
                color: Colors.red,
                title: 'Delete \ncompleted',
              ),
            ],

            // End of the actions
          ),
          Observer(builder: (_) {
            //  The text when Todos are empty

            if (todosState.todos.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'You don\'t have todos yet',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            }

            // Looping over Todos

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1 + todosState.todos.length,
                ((context, index) {
                  if (index == 0) {
                    return CreateFilterSection(
                      key: filterKey,
                    );
                  }
                  final String todoNumber = (index + 1).toString();
                  final Todo todo = todosState.todos[index - 1];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TodoItem(
                        deleteTodo: () => todosState.deleteTodo(todo.id),
                        todo: todo,
                        index: todoNumber),
                  );
                }),
              ),
            );
          }),
        ],
      ),

      // FloatingButton to create new Todo

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _routeToCreateTodo,
        icon: const Icon(Icons.add),
        label: const Text('Add todo'),
      ),
    );
  }
}

class CreateFilterSection extends StatefulWidget {
  const CreateFilterSection({Key? key}) : super(key: key);

  @override
  State<CreateFilterSection> createState() => _CreateFilterSectionState();
}

class _CreateFilterSectionState extends State<CreateFilterSection> {
  bool isAllChecked = true;
  bool isCompletedChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterButton(
          isChecked: isAllChecked,
          label: 'All',
          onPressed: () {
            setState(() {
              isAllChecked = true;
              isCompletedChecked = false;
            });
          },
        ),
        FilterButton(
          isChecked: isCompletedChecked,
          label: 'Completed',
          onPressed: () {
            setState(() {
              isCompletedChecked = true;
              isAllChecked = false;
            });
          },
        ),
      ],
    );
  }
}
