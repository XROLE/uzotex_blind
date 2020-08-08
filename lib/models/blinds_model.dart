class Blinds {
  String name;
  int id;
  int quantity;
  String imageUrl;
  // You can add a list or array of samples that the window blind contain here

  Blinds({this.name, this.id, this.quantity, this.imageUrl});
}

List<Blinds> blinds = [
  Blinds(
    name: 'Swirl Bandit',
    id: 746528,
    quantity: 178,
    imageUrl: 'assets/images/blinds/blind1.jpg'
  ),
  Blinds(
    name: 'Dove Marley',
    id: 789887,
    quantity: 238,
    imageUrl: 'assets/images/blinds/blind2.jpg'
  ),
  Blinds(
    name: 'Sun Lord',
    id: 980957,
    quantity: 458,
    imageUrl: 'assets/images/blinds/blind3.jpg'
  ),
  Blinds(
    name: 'Gray Gucchi',
    id: 765009,
    quantity: 45,
    imageUrl: 'assets/images/blinds/blind4.jpg'
  ),
  Blinds(
    name: 'Blending Nova',
    id: 898443,
    quantity: 759,
    imageUrl: 'assets/images/blinds/blind5.jpg'
  ),
  Blinds(
    name: 'Lion\'s Prixe',
    id: 123456,
    quantity: 204,
    imageUrl: 'assets/images/blinds/blind6.jpg'
  ),
  Blinds(
    name: 'Curtain Backup',
    id: 124987,
    quantity: 130,
    imageUrl: 'assets/images/blinds/blind7.jpg'
  ),
];
