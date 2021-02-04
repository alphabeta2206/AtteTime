import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> add(String day, String name, String startingtime, String endingtime,
    String faculty, String classroom, String slottype) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection(day)
        .doc(name);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Name': name,'Startingtime': startingtime,'Endingtime': endingtime,
        'Faculty': faculty,'Classroom': classroom,'Slottype': slottype});
        return true;
      }
    });
  } catch (e) {
    return false;
  }
}
