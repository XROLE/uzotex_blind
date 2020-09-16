import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uzotex_blind/models/product.dart';

String collection = 'window-blinds';

class DatabaseService {
  final CollectionReference db =
      FirebaseFirestore.instance.collection('window-blinds/Blood/Blood');
  final CollectionReference blindCollections =
      FirebaseFirestore.instance.collection(collection);

  Future createCategory(String name, String image) async {
    return blindCollections.doc(name).set({'Name': name, 'Image': image});
  }

  Future createUnit(String name, String category, String id, String image,
      String price, String collectionId) {
    return blindCollections.doc(collectionId).collection(category).doc(id).set({
      "Id": id,
      "Name": name,
      "Price": price,
      "Category": category,
      "Image": image
    });
  }

  // Deserialize Data from firebase
  List<Category> _categoriesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
          return Category(
            uid: doc.reference.path.substring(14) ?? '',
            name: doc.data()['Name'] ?? '',
            image: doc.data()['Image'] ?? '',
          );
        }).toList() ??
        [];
  }

  List<UnitModel> _unitListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UnitModel(
        name: doc.data()['Name'] ?? '',
        id: doc.data()['Id'] ?? '',
        price: doc.data()['Price'] ?? '',
        imageUrl: doc.data()['Image'] ?? '',
        category: doc.data()['Category'] ?? '',
      ) ?? [];
    });
  }

  Stream<List<UnitModel>> get subCollection {
    return db.snapshots().map(_unitListFromSnapshot);
  }

  Stream<List<UnitModel>> get subcollection2 {
    return blindCollections.snapshots().map((event) {
      return event.docs.map((doc) {
        return UnitModel(
          name: doc.data()['Name'] ?? '',
          id: doc.data()['Id'] ?? '',
          price: doc.data()['Price'] ?? '',
          imageUrl: doc.data()['Image'] ?? '',
          category: doc.data()['Category'] ?? '',
        );
      });
    });
  }

  Stream<List<Category>> get getCategories {
    return blindCollections.snapshots().map(_categoriesListFromSnapshot);
  }
}
