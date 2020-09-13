import 'package:firebase_auth/firebase_auth.dart';
import 'package:uzotex_blind/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _networkError =
      '[firebase_auth/email-already-in-use] The email address is already in use by another account.';
  String _duplicateMailError =
      '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.';

  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      if (e.toString() == _networkError) {
        return 'Please make sure you an active internet connection';
      } else if (e.toString() == _duplicateMailError) {
        return 'User already exist';
      }
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      if (e.toString() == _networkError) {
        return 'Please make sure you have an active internet connection';
      } else if (e.toString() == _duplicateMailError) {
        return 'User already exist';
      }
    }
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
