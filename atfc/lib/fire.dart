import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> addslt(String id, String name, String startingtime, String endingtime,
    String faculty, String classroom, String slottype, String day) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection(day)
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Name': name});
        documentReference.set({'Startingtime': startingtime});
        documentReference.set({'Endingtime': endingtime});
        documentReference.set({'Faculty': faculty});
        documentReference.set({'Classroom': classroom});
        return true;
      }
    });
  } catch (e) {
    return false;
  }
}
