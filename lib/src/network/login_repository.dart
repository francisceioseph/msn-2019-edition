import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return e;
    }
  }

  logout() async {
    _auth.signOut();
  }
}
