// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "appName": "Todooos",
  "appTitleNewTask": "مهام الجديدة",
  "appTitleDoneTask": "مهام المنتهية",
  "appTitleArchivedTask": "الارشيف",
  "titleIsEmptyFormFiled": "عنوان مهمة  ليس موجود",
  "timeIsEmptyFormFiled": "معاد مهمة ليس موجود",
  "dateIsEmptyFormFiled": "تريخ مهمة ليس موجود",
  "taskTitleFormFiledLabel": "عنوان المهمة",
  "taskTimeFormFiledLabel": "معاد الممهمة",
  "taskDateFormFiledLabel": "تريخ المهمة",
  "newTaskBottomNav": "مهام الجديدة",
  "doneTaskBottomNav": "مهام المنتهية",
  "archivedTaskBottomNav": "الارشيف",
  "noTasksYet": "لا يوجد مهام اضف مهام جديد"
};
static const Map<String,dynamic> en = {
  "appName": "Tdooos",
  "appTitleNewTask": "NewTask",
  "appTitleDoneTask": "DoneTask",
  "appTitleArchivedTask": "ArchivedTask",
  "titleIsEmptyFormFiled": "Title is empty",
  "timeIsEmptyFormFiled": "Time is empty",
  "dateIsEmptyFormFiled": "Date is empty",
  "taskTitleFormFiledLabel": "Task Title",
  "taskTimeFormFiledLabel": "Task Time",
  "taskDateFormFiledLabel": "Task Date",
  "newTaskBottomNav": "NewTask",
  "doneTaskBottomNav": "DoneTask",
  "archivedTaskBottomNav": "Archived",
  "noTasksYet": "No Tasks Yet, Please Add Some Tasks"
};
static const Map<String,dynamic> es = {
  "appName": "Tdooos",
  "appTitleNewTask": "Nueva Tarea",
  "appTitleDoneTask": "Terminada Tarea",
  "appTitleArchivedTask": "Tarea Archivada",
  "titleIsEmptyFormFiled": "Título está vacío",
  "timeIsEmptyFormFiled": "tiempo Está vacío",
  "dateIsEmptyFormFiled": "Fecha Está vacía",
  "taskTitleFormFiledLabel": "Título De La Tarea",
  "taskTimeFormFiledLabel": "Tiempo De Tarea",
  "taskDateFormFiledLabel": "Fecha De La Tarea",
  "newTaskBottomNav": "Nueva tarea",
  "doneTaskBottomNav": "Terminada Tarea",
  "archivedTaskBottomNav": "Tarea Archivada",
  "noTasksYet": "No hay tareas todavía, por favor agregue algunas tareas"
};
static const Map<String,dynamic> fr = {
  "appName": "Todooos",
  "appTitleNewTask": "Nouvelle tâche",
  "appTitleDoneTask": "TerminéTâche",
  "appTitleArchivedTask": "Tâche archivée",
  "titleIsEmptyFormFiled": "Le titre est vide",
  "timeIsEmptyFormFiled": "Le temps est vide",
  "dateIsEmptyFormFiled": "La date est vide",
  "taskTitleFormFiledLabel": "Titre de la tâche",
  "taskTimeFormFiledLabel": "Temps de tâche",
  "taskDateFormFiledLabel": "Date de la tâche",
  "newTaskBottomNav": "Nouvelle tâche",
  "doneTaskBottomNav": "Terminé Tâche",
  "archivedTaskBottomNav": "Tâche archivée",
  "noTasksYet": "Aucune tâche pour le moment, veuillez ajouter des tâches"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "es": es, "fr": fr};
}
