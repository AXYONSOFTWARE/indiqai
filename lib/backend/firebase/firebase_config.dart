import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyApB8J_RMMJjzBR6hNK9aRPyFDchpgSpxU",
            authDomain: "indiq-ai-g3a3xk.firebaseapp.com",
            projectId: "indiq-ai-g3a3xk",
            storageBucket: "indiq-ai-g3a3xk.appspot.com",
            messagingSenderId: "845438681594",
            appId: "1:845438681594:web:73f51ca372ed7657392443"));
  } else {
    await Firebase.initializeApp();
  }
}
