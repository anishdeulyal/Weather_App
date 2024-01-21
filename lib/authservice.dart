import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";

    }catch(e){
      return e.toString();
    }

  }

  // sign in with email and password
 Future signIn(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e){
      return e.toString();
    }
 }

 // Sign out
 Future signOut() async{
    await _auth.signOut();
 }
}