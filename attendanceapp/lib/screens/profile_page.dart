import 'package:attendanceapp/screens/home_page.dart';
import 'package:attendanceapp/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:attendanceapp/screens/student_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'getdata.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(
      {super.key,
      required this.Name,
      required this.Address,
      required this.Dob,
      required this.Bloodgroup,
      required this.Degree,
      required this.MobileNo,
      required this.Class,
      required this.RollNo,
      required this.Email});
  final String Name;
  final String Address;
  final String Dob;
  final String Bloodgroup;
  final String Degree;
  final String MobileNo;
  final String Class;
  final String RollNo;
  final String Email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Icon(Icons.arrow_back)),
              SizedBox(
                width: 20,
              ),
              Text("My Profile"),
            ],
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                //send report
              },
              child: Container(
                padding: EdgeInsets.only(right: kDefaultPadding / 2),
                child: Row(children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  kHalfSizedBox,
                  Text(
                    "Report",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white),
                  ),
                ]),
              ),
            ),
          ]),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                    bottomRight: Radius.circular(kDefaultPadding * 2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    minRadius: 50,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage("assets/images/splash.png"),
                  ),
                  SizedBox(
                    width: kDefaultPadding * 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Name,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "RollNo : " + RollNo,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Profiledetail(title: "Addmission No", value: "21bcs009"),
                Profiledetail(title: "Academic year", value: "2022-2023"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Profiledetail(title: "Class", value: Class),
                Profiledetail(title: "Degree", value: Degree),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Profiledetail(title: "BirthDay", value: Dob),
                Profiledetail(title: "Blood Group", value: Bloodgroup),
              ],
            ),
            //Profilecontact(c_title: "Email", c_value: "727621bcs009@mcet.in")
            Profilecontact(c_title: "Email", c_value: Email),
            Profilecontact(c_title: "Phone No", c_value: MobileNo),
            Profilecontact(c_title: "Address", c_value: Address),
          ],
        ),
      ),
    );
  }
}

class Profiledetail extends StatelessWidget {
  const Profiledetail({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: kTextLightColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              sizedBox,
              Text(value,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: kTextBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              sizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Divider(
                  thickness: 1,
                ),
              )
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class Profilecontact extends StatelessWidget {
  const Profilecontact(
      {super.key, required this.c_title, required this.c_value});
  final String c_title;
  final String c_value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                c_title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: kTextLightColor, fontSize: 15),
              ),
              kHalfSizedBox,
              Text(
                c_value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kTextBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1,
                ),
              )
            ],
          ),
          Icon(Icons.lock_outline, size: 20)
        ],
      ),
    );
  }
}
