import '../../../core/utils/constants.dart';

class NoteModel {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const NoteModel({
    this.id,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  NoteModel copyWith({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  static NoteModel fromJson(Map<String, Object?> json) => NoteModel(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
