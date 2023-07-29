import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/data/constants/app_localizations.dart';
import 'package:todo_task/data/local/local_db.dart';
import 'package:todo_task/data/model/user_model.dart';
import 'package:todo_task/screens/add/add_page.dart';
import 'package:todo_task/screens/add/add_todo.dart';
import 'package:todo_task/screens/calendar/calendar_page.dart';
import 'package:todo_task/screens/focuse/focus_page.dart';
import 'package:todo_task/screens/index/index_page.dart';
import 'package:todo_task/screens/profile/profile_page.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomMenu _currentTab = BottomMenu.add;

  void _selectTab(BottomMenu tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  List<TodoFields> myTodos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_363636,
      body: IndexedStack(
        index: _currentTab.index,

        children: [IndexPage(), CalendarPage(), AddPage(todoFields: myTodos), FocusPage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab.index,
        backgroundColor: AppColors.C_363636,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          _selectTab(BottomMenu.values[index]);
        },
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.indexIcon), label: "Index"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.calendarIcon), label: "Calendar"),
          BottomNavigationBarItem(icon: IconButton(
            onPressed: () async {
              final result = await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => AddTodo(),
              );
              if (result != null && result == true) {
                myTodos = await LocalDatabase.getAllTodoFields();
                setState(() {});
              }
            },
            icon: SvgPicture.asset(AppIcons.addIcon),
          ), label: "Add"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.clockIcon), label: "Focuse"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.profileIcon), label: "Profile"),
        ],
      ),
    );
  }
}

enum BottomMenu { home, calendar, add,focuse, profile }
