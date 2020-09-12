import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference blindCollections =
      FirebaseFirestore.instance.collection('window-blinds');

  Future createCategory(String name, String image) async {
    return blindCollections.add({'Name': name, 'Image': image});
  }
}
