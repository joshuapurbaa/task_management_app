// TODO 16: buat task list screen

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_2/components/task_item_card.dart';
import 'package:task_management_2/models/db_manager.dart';
import 'package:task_management_2/models/task_manager.dart';
import 'package:task_management_2/screens/task_item_screen.dart';

class TaskListScreen extends StatelessWidget {
  // final TaskManager manager;
  final DbManager manager;
  const TaskListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final taskItems = manager.taskModels;
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<DbManager>(
          builder: (context, manager, child) {
            final taskItems = manager.taskModels;
            return ListView.separated(
              itemCount: taskItems.length,
              itemBuilder: (context, index) {
                final item = taskItems[index];
                // TODO 17: Menambahkan call back handler untuk menghapus list dan menambahkan scafold messenger
                // TODO :
                return InkWell(
                  onTap: () async {
                    final selectedTask = await manager.getTaskById(item.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskItemScreen(
                          taskModel: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: TaskItemCard(
                    // key: Key(item.id),
                    // key: Key(item.id.toString()),
                    task: item,
                    onPressed: () {
                      Navigator.pop(context);
                      manager.deleteTask(item.id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.taskName} Deleted')),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ));
  }
}
