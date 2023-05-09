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
  "appTitleNewTask": "NuevaTarea",
  "appTitleDoneTask": "TerminadaTarea",
  "appTitleArchivedTask": "ArchivadaTarea",
  "titleIsEmptyFormFiled": "Título está vacío",
  "timeIsEmptyFormFiled": "tiempo está vacío",
  "dateIsEmptyFormFiled": "Fecha está vacía",
  "taskTitleFormFiledLabel": "Título de la tarea",
  "taskTimeFormFiledLabel": "Tiempo de la tarea",
  "taskDateFormFiledLabel": "Fecha de La tarea",
  "newTaskBottomNav": "Nueva tarea",
  "doneTaskBottomNav": "Terminada tarea",
  "archivedTaskBottomNav": "Archivada",
  "noTasksYet": "No hay tareas todavía, por favor agregue algunas tareas"
};
static const Map<String,dynamic> fr = {
  "appTitleNewTask": "NouvelleTâche",
  "appTitleDoneTask": "TerminéTâche",
  "appTitleArchivedTask": "archivéeTâche",
  "titleIsEmptyFormFiled": "Le titre est vide",
  "timeIsEmptyFormFiled": "Le temps est vide",
  "dateIsEmptyFormFiled": "La date est vide",
  "taskTitleFormFiledLabel": "Titre de la tâche",
  "taskTimeFormFiledLabel": "Temps de tâche",
  "taskDateFormFiledLabel": "Date de la tâche",
  "newTaskBottomNav": "Nouvelle Tâche",
  "doneTaskBottomNav": "Terminé Tâche",
  "archivedTaskBottomNav": "archivée",
  "noTasksYet": "Aucune tâche pour le moment, veuillez ajouter des tâches"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "es": es, "fr": fr};
}
