import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> initFirebase() async {
  return await Firebase.initializeApp();
}
