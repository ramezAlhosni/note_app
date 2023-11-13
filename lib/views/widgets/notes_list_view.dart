import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            List<NoteModel> notes =
                BlocProvider.of<NotesCubit>(context).notes ?? [];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: NoteItem(
                      note: notes[index],
                    ),
                  );
                },
                itemCount: notes.length,
              ),
            );
          },
        );
      },
    );
  }
}
