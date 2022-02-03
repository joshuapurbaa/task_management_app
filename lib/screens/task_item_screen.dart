// TODO 8: Membuat task item screen, membuat properti dan constructor

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_2/models/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _TaskItemScreenState createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  // TODO 10: add state properti
  final _taskNameController = TextEditingController();
  String _taskName = '';
  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        _taskName = _taskNameController.text;
      });
    });
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // buildTaskNameField
            // TODO 11: buat name field
            buildNameField(),
            const SizedBox(
              height: 16,
            ),
            // buildButton
            // TODO 12: buat button
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task title',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'E.g. study',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: Text(
        'Create Task',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        // TODO 14: add callback handler
        // TODO 15: add package uuid
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          taskName: _taskNameController.text,
        );
        widget.onCreate(taskItem);
      },
    );
  }
}
