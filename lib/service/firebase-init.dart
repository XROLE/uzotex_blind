import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp();

Widget initFirebase() {
  return FutureBuilder(
    // Initialize FlutterFire:
    future: initialization,
    builder: (context, snapshot) {
      // Check for errors
      if (snapshot.hasError) {
        return Text('I am a chosen one ==> Ojochide');
      }

      // Once complete, show your application
      if (snapshot.connectionState == ConnectionState.done) {
        return Text('I am a chosen one ===>  worked correctly');
      }

      // Otherwise, show something whilst waiting for initialization to complete
      return Text('I am a chosen one loading');
    },
  );
}
