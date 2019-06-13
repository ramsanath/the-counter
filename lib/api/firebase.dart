import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Firebase {
  static FirebaseApp _firebaseApp;
  static FirebaseDatabase _database;

  Firebase._();

  static _initFirebaseApp() async {
    if (_firebaseApp != null) return;

    _firebaseApp = await FirebaseApp.configure(
      name: "counter",
      options: _firebaseConfig,
    );
  }

  static _initDatabase() {
    if (_database != null) return;

    _initFirebaseApp();
    _database = FirebaseDatabase.instance;
  }

  static FirebaseApp get app {
    _initFirebaseApp();
    return _firebaseApp;
  }

  static FirebaseDatabase get database {
    _initDatabase();
    return _database;
  }

  static get _firebaseConfig {
    return FirebaseOptions(
        googleAppID: Platform.isAndroid
            ? "FIREBASE-ANDROID-APP-ID"
            : "FIREBASE-IOS-APP-ID",
        gcmSenderID: "PROJECT-NUMBER",
        databaseURL: "DATABASE-URL",
        apiKey: "API-KEY");
  }
}
