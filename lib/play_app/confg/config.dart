import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrazyCoinsApp {
  static const String appName = 'Crazy Coins';

  static SharedPreferences sharedPreferences;
  static User user;
  static FirebaseAuth auth;
  static FirebaseFirestore firestore;

  static const String userName = 'name';
  static const String userEmail = 'email';
  static const String userUID = 'uid';

  static const String userSlotList = 'userSlot'; //like cartlist

}
