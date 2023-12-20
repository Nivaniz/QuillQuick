enum TypeNote {
  Text,
  Image,
  Network, //Missing se puede agregar desde custom_cards
  TextImage,
  TextNetwork, //Missing se puede agregar desde custom_cards
  ImageNetwork, //Missing se puede agregar desde custom_cards
  TextImageNetwork //Missing se puede agregar desde custom_cards
}

enum StateNote { Visible, Archive, Delete }

enum StateTask { Done, Review, PastDate, Create }

enum StatusNetwork { Connected, NoInternet, Exception }
