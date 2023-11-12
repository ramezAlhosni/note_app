import 'package:note_app/models/note_model.dart';

class NoteCubitState {}

class NotesInitial extends NoteCubitState {}

class NotesLoading extends NoteCubitState {}

class NotesSuccess extends NoteCubitState {
  final List<NoteModel> notes;

  NotesSuccess({required this.notes});
}

class Notesfailure extends NoteCubitState {
  final String errMessage;

  Notesfailure({required this.errMessage});
}
