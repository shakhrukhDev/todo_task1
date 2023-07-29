import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/data/local/local_db.dart';
import 'package:todo_task/data/model/user_model.dart';
import 'package:todo_task/utils/app_icons.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  FocusNode ageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Text'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'description'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: timeController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'time'),
              ),
              const SizedBox(
                height: 15,
              ),
              IconButton(
                onPressed: () async {
                  await LocalDatabase.insertTodoFields(
                    TodoFields(
                      title: titleController.text,
                      description: descriptionController.text,
                      time: timeController.text,
                    ),
                  );
                  timeController.clear();
                  descriptionController.clear();
                  titleController.clear();
                  Navigator.pop(context, true);
                },
                icon: SvgPicture.asset(AppIcons.sendIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
