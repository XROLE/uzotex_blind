import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uzotex_blind/models/blinds_model.dart';

String collection = 'window-blinds';

class DatabaseService {
  final CollectionReference blindCollections =
      FirebaseFirestore.instance.collection(collection);

  Future createCategory(String name, String image) async {
    return blindCollections.add({'Name': name, 'Image': image});
  }

  Future createUnit(
      String name, String category, String id, String image, String price) {
    return blindCollections
        .doc('JXRaEdvy2Jx9O52xcQw9')
        .collection(collection)
        .add({
      "Id": id,
      "Name": name,
      "Price": price,
      "Category": category,
      "Image": image
    });
  }

  List<Category> _categoriesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Category(
        uid: doc.reference.path.substring(14) ?? '',
        name: doc.data()['Name'] ?? '',
        image: doc.data()['Image'] ?? '',
      );
    }).toList();
  }

  Stream<List<Category>> get getCategories {
    return blindCollections.snapshots().map(_categoriesListFromSnapshot);
  }
}
