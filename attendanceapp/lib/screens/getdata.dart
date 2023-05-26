import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

/*class details {
  final String Address;
  final String Bloodgroup;
  final String Degree;
  final String Dob;
  final String MobileNo;
  final String Name;
  final String RollNo;
  final String Class;
  details(this.Address, this.Bloodgroup, this.Degree, this.Dob, this.MobileNo,
      this.Name, this.RollNo, this.Class);
  toJson() {
    return {
      "Address": Address,
      "Bloodgroup": Bloodgroup,
      "Degree": Degree,
      "Dob": Dob,
      "MobileNo": MobileNo,
      "Name": Name,
      "RollNo": RollNo,
      "Class": Class,
    };
  }
}

class getall {
  final _db = FirebaseFirestore.instance;
  createUser(details user) async {
    _db
        .collection("students")
        .add(user.toJson())
        .whenComplete(() => print("success"));
  }
}
class Getdata {
 final students = FirebaseFirestore.instance
      .collection('students')
      .get()
      .then((QuerySnapshot) {
    List dataitem = [];
    print("success");
    for (var docSnapshot in QuerySnapshot.docs) {
      dataitem.add(docSnapshot.data());
    }
    for (var element in dataitem) {
      for (var data in element.keys) {}
    }
  });
}*/
class GetData {
  const GetData(this.uid);
  final String uid;
  Future getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await FirebaseFirestore.instance
          .collection("students")
          .doc(uid)
          .get();
      String Name = ds.get('Name');
      String Address = ds.get('Address');
      String Dob = ds.get('Dob');
      String Bloodgroup = ds.get('Bloodgroup');
      String Degree = ds.get('Degree');
      String MobileNo = ds.get('MobileNo');
      String Class = ds.get('class');
      String RollNo = ds.get('RollNo');
      int attend = ds.get("attend");
      int noclass = ds.get("noofclass");
      double grade = ds.get("grade");
      var details = {
        'Name': Name,
        "Address": Address,
        "Dob": Dob,
        'Bloodgroup': Bloodgroup,
        'Degree': Degree,
        'MobileNo': MobileNo,
        "Class": Class,
        'RollNo': RollNo,
        "Email": uid,
        "attend": attend,
        "noofclass": noclass,
        "grade": grade,
      };
      return details;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
