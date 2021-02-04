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
        documentReference.set({'Name': name});
        documentReference.set({'Startingtime': startingtime});
        documentReference.set({'Endingtime': endingtime});
        documentReference.set({'Faculty': faculty});
        documentReference.set({'Classroom': classroom});
        documentReference.set({'Slottype': slottype});
        return true;
      }
    });
  } catch (e) {
    return false;
  }
}
