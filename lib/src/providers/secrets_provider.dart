// import 'package:firebase_database/firebase_database.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:secrets_app/src/models/secrets_model.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecretProvider with ChangeNotifier{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference secretsCollection = FirebaseFirestore.instance.collection('secrets');

  Stream<QuerySnapshot> getSecrets()  {
  final secrets = secretsCollection.snapshots();
  return secrets;
  }

  Future<void> addSecret(name, date, description, image, audio) async {

    final secret = new Secret(name: name, date: date, description: description, image: image, audio: audio).toMap();
    await secretsCollection.add(secret);
  }

  Future<void> batchDelete() {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return secretsCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });

      return batch.commit();
    });
  }
}