import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDYR19Qcp7-O15B4QGFMqMx_u8IO2Qakwk",
            authDomain: "clubconnect-63eaf.firebaseapp.com",
            projectId: "clubconnect-63eaf",
            storageBucket: "clubconnect-63eaf.appspot.com",
            messagingSenderId: "300780345336",
            appId: "1:300780345336:web:1cbc01f28c9e0d1199e80d",
            measurementId: "G-N5S0HX8EXP"));
  } else {
    await Firebase.initializeApp();
  }
}
