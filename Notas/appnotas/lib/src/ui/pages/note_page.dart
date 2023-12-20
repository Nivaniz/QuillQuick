// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:appnotas/src/core/constants/data.dart';
import 'package:appnotas/src/core/constants/parameters.dart';
import 'package:appnotas/src/core/controllers/theme_controller.dart';
import 'package:appnotas/src/core/models/notes.dart';
import 'package:appnotas/src/ui/widgets/buttons/simple_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class NotePageArguments {
  final Note? note;
  NotePageArguments({this.note});
}

Color fontColor() {
  return ThemeController.instance.brightnessValue ? Colors.black : Colors.white;
}

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);

  static const NOTE_PAGE_ROUTE = "note_page";

  String _title(Note? note) {
    if (note != null && note.title != null) {
      return note.title!;
    }
    return "Sin título"; // Provide a default title if note or note.title is null
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve route arguments
    NotePageArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as NotePageArguments?;

    // Check if arguments is null, and provide a default Note if needed
    final Note note = arguments?.note ?? Note(); // Use a default Note if null
    final theme = ThemeController.instance;
    return Scaffold(
      backgroundColor: theme.background(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeController.instance.primary(),
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: fontColor(),
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          _title(note),
          style: TextStyle(color: fontColor()),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
      body: _Body(note),
    );
  }
}

class _Body extends StatelessWidget {
  final Note note;

  _Body(this.note, {Key? key}) : super(key: key);

  Widget _image() {
    if (note.type == TypeNote.Image ||
        note.type == TypeNote.ImageNetwork ||
        note.type == TypeNote.TextImage ||
        note.type == TypeNote.TextImageNetwork) {
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(note.image ?? Constants.DEFAULT_IMAGE),
                fit: BoxFit.cover)),
      );
    }
    return Container();
  }

  void urls(String text) {
    note.urls = [];
    RegExp regexp =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> match = regexp.allMatches(text);
    match.forEach((element) {
      note.urls?.add(text.substring(element.start, element.end));
    });
  }

  @override
  Widget build(BuildContext context) {
    urls(note.description ?? "");
    return Container(
      child: Column(children: [
        _image(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            note.description ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(color: fontColor()),
          ),
        ),
        Divider(),
        Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: note.urls!.length,
                itemBuilder: (context, index) {
                  final url = note.urls![index];
                  return ListTile(
                    onTap: () {
                      launch(url);
                    },
                    title: Text(url,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.blue)),
                  );
                }))
      ]),
    );
  }
}
