import 'package:appnotas/src/core/constants/parameters.dart';

class Note {
  String? title;
  String? date;
  String? description;
  bool private;
  List<String>? urls;
  String? image;
  TypeNote type;
  StateNote state;

  Note({
    this.date,
    this.description,
    this.private = false,
    this.title,
    this.image,
    this.urls,
    this.type = TypeNote.Text,
    this.state = StateNote.Visible,
  });
}

Note note = Note(
    title: "Mi primera nota",
    description: "Esta es mi primera nota",
    type: TypeNote.Text,
    date: "06-05-2021");

Note note1 = Note(
    title: "Mi primera nota",
    description: "Esta es mi primera nota",
    type: TypeNote.Image,
    image:
        "https://images.unsplash.com/photo-1621272036047-bb0f76bbc1ad?q=80&w=1912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "06-05-2021");

Note note2 = Note(
    title: "Mi primera nota",
    description:
        "Esta es mi primera nota https://pub.dev/packages/flutter_staggered_grid_view/example",
    type: TypeNote.TextImage,
    image:
        "https://images.unsplash.com/photo-1621272036047-bb0f76bbc1ad?q=80&w=1912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    date: "06-05-2021");

List<Note> notes = [note, note1, note2, note, note1, note2, note, note1, note2];
