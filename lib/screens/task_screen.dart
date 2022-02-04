import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_management_2/components/profile_sheet.dart';
import 'package:task_management_2/models/db_manager.dart';
import 'package:task_management_2/models/task_manager.dart';
import 'package:task_management_2/screens/task_list_screen.dart';

import 'empty_task_screen.dart';
import 'task_item_screen.dart';

// TODO 2: Membuat Task Screen
class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Management',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        // TODO 18: buat bottom sheet
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => const ProfileSheet(),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),

      // TODO 9: Buat Floating Action Button dan Navigasi ke task item screen
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // final manager = Provider.of<TaskManager>(context, listen: false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => TaskItemScreen(
          //       onCreate: (task) {s
          //         manager.addTask(task);
          //         Navigator.pop(context);
          //       },
          //     ),
          //   ),
          // );
          // TODO :
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskItemScreen(),
            ),
          );
        },
      ),
      // TODO 7: Add buildTaskScreen
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    // TODO :
    return Consumer<DbManager>(
      builder: (context, manager, child) {
        if (manager.taskModels.isNotEmpty) {
          return TaskListScreen(
            manager: manager,
          );
        } else {
          return const EmptyTaskScreen();
        }
      },
    );
    // return Consumer<TaskManager>(
    //   builder: (context, manager, child) {
    //     if (manager.taskModels.isNotEmpty) {
    //       return TaskListScreen(
    //         manager: manager,
    //       );
    //     } else {
    //       return const EmptyTaskScreen();
    //     }
    //   },
    // );
  }
}
