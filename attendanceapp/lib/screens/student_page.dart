import 'package:attendanceapp/screens/datastd.dart';
import 'package:attendanceapp/screens/getdata.dart';
import 'package:attendanceapp/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../styles/colors.dart';

class StudentPage extends StatelessWidget {
  const StudentPage(
      {super.key,
      required this.StudentName,
      required this.RollNo,
      required this.BatchYear});
  final String StudentName;
  final String RollNo;
  final String BatchYear;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              StudentName,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
            )
          ],
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Text(
          RollNo,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Container(
          width: 100,
          height: 20,
          decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          child: Center(
            child: Text(
              BatchYear,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ],
    );
  }
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key, required this.ProfilePic});
  final String ProfilePic;

  @override
  Widget build(BuildContext context) {
    //final usersdata = DataRepository.instance.users;
    return GestureDetector(
      onTap: () async {
        dynamic details =
            await GetData(FirebaseAuth.instance.currentUser!.email.toString())
                .getCurrentUserData();
        String Name = details["Name"].toString();
        String Address = details["Address"].toString();
        String Dob = details["Dob"].toString();
        String Class = details["Class"].toString();
        String RollNo = details["RollNo"].toString();
        String Bloodgroup = details["Bloodgroup"].toString();
        String Degree = details["Degree"].toString();
        String MobileNo = details["MobileNo"].toString();
        String Email = details["Email"].toString();
        int attend = details["attend"];
        int noofclass = details["noofclass"];
        //double grade = details['grade'];
        datafiles(
            Name: Name,
            Address: Address,
            Dob: Dob,
            Class: Class,
            RollNo: RollNo,
            Bloodgroup: Bloodgroup,
            Degree: Degree,
            MobileNo: MobileNo,
            ID: Email,
            attend: attend,
            noclass: noofclass);

        //return details[elements]
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => ProfilePage(
                Name: Name,
                Address: Address,
                Dob: Dob,
                Class: Class,
                RollNo: RollNo,
                Bloodgroup: Bloodgroup,
                Degree: Degree,
                MobileNo: MobileNo,
                Email: Email)));
        //view profile
      },
      child: CircleAvatar(
        minRadius: 50,
        maxRadius: 50,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(ProfilePic),
      ),
    );
  }
}
