import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/core/database/notes_database.dart';
import 'package:todo_app_sqflite/feature/data/model/note_model.dart';

class HomeProvider extends ChangeNotifier {
  final NotesDatabase helper = NotesDatabase.instance;
  final BuildContext context;
  bool isLoading = false;

  HomeProvider(this.context);

  void setLoading(bool load) {
    isLoading = load;
    notifyListeners();
  }

  Future<void> createItem(NoteModel newItem) async {
    await helper.create(newItem);
    notifyListeners();
  }

  Future<List<NoteModel>> getAllTodo() async {
    return await helper.readAllNotes();
  }

  Future<void> updateItem(int itemKey, NoteModel item) async {
    await helper.update(item);
    notifyListeners();
  }

  Future<void> deleteItem(int itemKey, bool mounted) async {
    await helper.delete(itemKey);
    notifyListeners();

    if (!mounted) return;
    showSnackBar(mounted);
  }

  void showSnackBar(bool mounted) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }
}
