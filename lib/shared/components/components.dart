import 'package:flutter/material.dart';

import '../bloc/app_cubit.dart';
import '../styles/color.dart';
import 'constant.dart';

/// to make task item
Widget buildTaskItem({
  required int taskNumber,
  required Map model,
  required BuildContext context,
}) =>
    Dismissible(
      key: Key(model['id'].toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'DELETE',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.end,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              'DELETE',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            Spacer(),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDate(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(pPadding),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              // time of task
              child: Text(
                '${model['time']}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: sColor,
            ),
            SizedBox(width: pSizeBox),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title of task
                  Text(
                    '${taskNumber + 1}: ${model['title']}',
                  ),
                  // date of task
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // this section to change status of task
            // when click you move the task to done screen or archive
            // NOTE: your update the status and id
            IconButton(
              onPressed: () {
                // this change to archive
                AppCubit.get(context)
                    .updateDatabase(status: 'archived', id: model['id']);
              },
              icon: Icon(
                Icons.archive,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                // and this change to done
                AppCubit.get(context)
                    .updateDatabase(status: 'done', id: model['id']);
              },
              icon: Icon(
                Icons.done,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );

/// this is default formField in my application
TextFormField defaultFormField({
  // this to get and set information form textFormField
  required TextEditingController controller,
  // label of textFormField
  required String label,
  // String? helper,
  bool isPassword = false,
  // that is validation message
  required FormFieldValidator<String> validMsg,
  // type of textFormField
  required TextInputType type,
  // this  icon
  required Widget prefixIcon,
  // when click on textFormField
  required Function()? onTap,
  // this when click
  bool? disableKeyBoard = false,
}) {
  return TextFormField(
    showCursor: disableKeyBoard,
    readOnly: disableKeyBoard!,
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onTap: () {
      onTap!();
    },
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    validator: validMsg,
  );
}
