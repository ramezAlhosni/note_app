import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.of(context).pop();
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'title',
            onChaged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
            onChaged: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          EditNotesColorsList(note: widget.note)
        ],
      ),
    );
  }
}

class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

@override
class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int currentIndex;
  late int priNoteColor;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    priNoteColor = widget.note.color;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.note.color = priNoteColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.note.color = kColors[index].value;
              currentIndex = index;
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
