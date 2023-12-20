import 'package:appnotas/src/core/constants/parameters.dart';

class Task {
  String? title;
  String? description;
  String? date;
  List<String>? urls;
  StateTask state;

  Task({
    this.urls,
    this.title,
    this.description,
    this.date,
    this.state = StateTask.Create,
  });
}
