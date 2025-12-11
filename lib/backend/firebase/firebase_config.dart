import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAN3kOpmrXbCvctLpnkdL_5QkIpAQ4UJLI",
            authDomain: "zapishi-backend-482da.firebaseapp.com",
            projectId: "zapishi-backend-482da",
            storageBucket: "zapishi-backend-482da.firebasestorage.app",
            messagingSenderId: "1006934420365",
            appId: "1:1006934420365:web:0d4c0a702fd7c9199e2bc4"));
  } else {
    await Firebase.initializeApp();
  }
}
