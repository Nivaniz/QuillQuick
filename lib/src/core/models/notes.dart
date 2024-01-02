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
    title: "Terminar de cocinar para la cena",
    description: "Cocinar el brocoli primero y después la pasta",
    type: TypeNote.Image,
    image:
        "https://ed88xd5c3h8.exactdn.com/wp-content/uploads/2021/11/receta-pasta-calabacin-pollo-para-bebes.jpg?strip=all&lossy=1&ssl=1",
    date: "06-01-2024");

Note note1 = Note(
    title: "Viaje a japón",
    description: "Reccorrido que hay que tomar para visitar japón:",
    type: TypeNote.Image,
    image:
        "https://colombojaponesa.edu.co/wp-content/uploads/2022/06/Templo-Kinkakuji-en-Kioto-Japon.jpg",
    date: "01-05-2024");

Note note2 = Note(
    title:
        "Cosas para agregar a mi portafolio personal: -Nueva seccion, - Datos personales",
    description:
        "Lo primero que hay que agregar a: https://codingwithnirvana.pythonanywhere.com",
    type: TypeNote.TextImage,
    image:
        "https://www.pixartprinting.it/blog/wp-content/uploads/2022/11/IMMAGINE-1.jpg",
    date: "06-08-2024");

Note note3 = Note(
    title: "Preparativos para la Cena Especial",
    description:
        "Comienza cocinando el pollo a la parrilla y luego prepara la ensalada fresca con aderezo de limón.",
    type: TypeNote.Image,
    image: "https://i.blogs.es/abc649/mejores-recetas-pollo/1366_2000.jpg",
    date: "05-01-2024");

Note note4 = Note(
    title: "Contraseña del internet",
    description: "Contraseña: AKD7D9FNFJDSO",
    type: TypeNote.Text,
    date: "05-01-2023");

Note note5 = Note(
    title: "Muestra de comida",
    description: "Muestra de platillos para el evento",
    type: TypeNote.TextImage,
    image:
        "https://www.unileverfoodsolutions.com.mx/tendencias/de-mexico-para-el-mundo/platillos-mexicanos/top10-platillos/jcr:content/parsys/content-aside-footer/columncontrol/columnctrl_parsys_1/textimage/image.transform/jpeg-optimized/image.1592429873377.jpg",
    date: "07-05-2024");

List<Note> notes = [note, note1, note2, note3, note4, note5];
