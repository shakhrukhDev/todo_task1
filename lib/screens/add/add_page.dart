import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/data/local/local_db.dart';
import 'package:todo_task/data/model/user_model.dart';
import 'package:todo_task/screens/home/description_page.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';

class AddPage extends StatefulWidget {
  List<TodoFields> todoFields;

  AddPage({super.key, required this.todoFields});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  _init() async {
    widget.todoFields = await LocalDatabase.getAllTodoFields();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: const Center(child: Text('My ToDo')),
        backgroundColor: Color(0xff121212),
        elevation: null,
        leading: const Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(Icons.add_alarm_outlined),
        ),
      ),
      body: widget.todoFields.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 84,
                ),
                Center(child: SvgPicture.asset(AppIcons.addIcon2)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'What do you want to do today?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Tap + to add your tasks',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.todoFields.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                  todo: widget.todoFields[index])));
                      if (result != null && result == true) {
                        widget.todoFields =
                            await LocalDatabase.getAllTodoFields();
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 327,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.C_363636,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(widget.todoFields[index].title),
                              subtitle: Text(widget.todoFields[index].time),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
