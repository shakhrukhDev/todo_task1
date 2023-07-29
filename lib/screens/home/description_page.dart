import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/data/local/local_db.dart';
import 'package:todo_task/data/model/user_model.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';


class DescriptionPage extends StatelessWidget {
  final TodoFields todo;

  const DescriptionPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.C_363636,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:12 ,),
                  ListTile(
                    title: Text(todo.title, style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Text(todo.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 25,),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.editIcon),
                        SizedBox(width: 20,),
                        Text('Edit Task'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(AppIcons.deleteIcon),
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                          onTap: ()async{
                            LocalDatabase.deleteTodoFieldsById(todo.id!);
                            Navigator.pop(context,true);

                          },
                          child: Text('Delete task',style: TextStyle(color: Colors.red),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}