import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firebaseCloud= FirebaseFirestore.instance;
class Collections{

  static CollectionReference users = firebaseCloud.collection("users");
}