import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/core/database/notes_database.dart';
import 'package:todo_app_sqflite/feature/data/model/note_model.dart';

class AddProvider extends ChangeNotifier {
  final NotesDatabase helper = NotesDatabase.instance;

  AddProvider();

  Future<void> createItem(NoteModel newItem) async {
    await helper.create(newItem);
    notifyListeners();
  }

  Future<void> updateItem(NoteModel item) async {
    await helper.update(item);
    notifyListeners();
  }

  Future<NoteModel?> readItem(int key) async {
    final item = await helper.readNote(key);
    return item;
  }
}
