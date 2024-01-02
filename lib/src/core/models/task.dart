import 'package:appnotas/src/core/constants/parameters.dart';

StateTask convertState(String value) {
  return StateTask.values.firstWhere((element) => element.toString() == value);
}

class Task {
  String? title;
  String? description;
  String? date;
  StateTask state;
  String? id;

  Task(
      {this.title,
      this.description,
      this.date,
      this.state = StateTask.Create,
      this.id});
}

Task task = Task(
    title: "Realizar compra de mercado",
    description: "Comprar cebolla, carne, zanahorias",
    date: "09-01-2024");
Task task2 = Task(
    title: "Realizar proyecto arquitectura",
    description: "Terminar los planos de la casa principal",
    date: "15-01-2024",
    state: StateTask.Done);
Task task3 = Task(
    title: "Realizar la cena",
    description: "Spaggeti con brocoli",
    date: "09-12-2023",
    state: StateTask.PastDate);

List<Task> tasks = [task, task2, task3];
