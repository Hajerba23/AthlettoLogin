import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // collection reference
  final CollectionReference athlettoCollection = FirebaseFirestore.instance.collection('athlettos');

}