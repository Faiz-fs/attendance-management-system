import 'dart:collection';

import 'package:attendanceapp/screens/attendance_page.dart' show AttendancePage;
import 'package:attendanceapp/screens/getdata.dart';
import 'package:attendanceapp/screens/login_page.dart';
import 'package:attendanceapp/screens/profile_page.dart';
import 'package:attendanceapp/screens/semmark_page.dart';
import 'package:attendanceapp/screens/student_page.dart';
import 'package:attendanceapp/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

String Name = '';
String RollNo = '';
double grade = 0.0;
double attendance = 0.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('students');
  void initState() {
    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((value) {
      setState(() {
        Name = value.get("Name").toString();
        RollNo = value.get("RollNo").toString();
        grade = value.get("grade");
        attendance = double.parse(
            ((value.get('attend') / value.get('noofclass')) * 100)
                .toStringAsFixed(2));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: kDefaultPadding / 6,
                    ),
                    StudentPage(
                        StudentName: Name.toString(),
                        RollNo: RollNo.toString(),
                        BatchYear: "2022-2023"),
                    SizedBox(
                      height: kDefaultPadding / 6,
                    ),
                    StudentProfile(
                      ProfilePic: "assets/images/splash.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (() {
                        //move to attendance
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => AttendancePage()));
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Attendance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 18,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w800),
                            ),
                            Text(
                              attendance.toString() + "%",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontSize: 35,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SemMarkPage()));
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Overall CGPA",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 18,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w800),
                            ),
                            Text(
                              grade.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontSize: 35,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3)),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "Ask"),
                        HomeCard(
                            onPress: () {},
                            icon: "assets/icons/assignment.svg",
                            title: "Assignment"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon: "assets/icons/holiday.svg",
                            title: "Holiday"),
                        HomeCard(
                            onPress: () {},
                            icon: "assets/icons/timetable.svg",
                            title: "Time Table"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon: "assets/icons/datesheet.svg",
                            title: "Leave & OD"),
                        HomeCard(
                            onPress: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => LoginPage()));
                            },
                            icon: "assets/icons/logout.svg",
                            title: "Logout "),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 40,
              width: 40,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}
