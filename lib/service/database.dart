import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uzotex_blind/models/blinds_model.dart';

class DatabaseService {
  final CollectionReference blindCollections =
      FirebaseFirestore.instance.collection('window-blinds');

  Future createCategory(String name, String image) async {
    return blindCollections.add({'Name': name, 'Image': image});
  }

  List<Category>   _categoriesListFromSnapshot (QuerySnapshot snapshot) {
   return snapshot.docs.map((doc) {
     return Category(
       name: doc.data()['Name'] ?? '',
       image: doc.data()['Image'] ?? ''
     );
   }).toList();
  }

  Stream<List<Category>>   get getCategories {
    return blindCollections.snapshots().map(_categoriesListFromSnapshot);
  }
}