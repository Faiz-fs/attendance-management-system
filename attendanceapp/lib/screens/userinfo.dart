import 'package:attendanceapp/screens/datastd.dart';
import 'package:attendanceapp/screens/getdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userinfo {
  //final String uid;

  userinfo();
  Future<List<datafiles>> fetchUsers() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('students').get();
    final users = snapshot.docs
        .map((doc) => datafiles(
              ID: doc.id,
              Name: doc.data()['Name'],
              Address: doc.data()['Address'],
              Bloodgroup: doc.data()['Bloodgroup'],
              Class: doc.data()['class'],
              Degree: doc.data()['Degree'],
              Dob: doc.data()['Dob'],
              MobileNo: doc.data()["MobileNo"],
              RollNo: doc.data()['RollNo'],
              attend: doc.data()['attend'],
              noclass: doc.data()['noofclass'],
            ))
        .toList();
    return users;
    /*
  Future getcollection() async {
    /*String uid;
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('students').get();
    final List<QueryDocumentSnapshot<Object?>> documents = result.docs;
    print(documents);
    //And after that you can iterate this list and get dat*/
    FirebaseFirestore.instance
        .collection('students')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.id);
      });
    });
  }*/
  }
}
