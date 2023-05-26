import 'package:attendanceapp/screens/getdata.dart';
import 'package:attendanceapp/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../styles/colors.dart';

double present = 0.0;
double absent = 0.0;

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('students');
  void initState() {
    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((value) {
      setState(() {
        present = double.parse(
            ((value.get('attend') / value.get('noofclass')) * 100)
                .toStringAsFixed(2));
        absent = 100 - present;
      });
    });
    super.initState();
  }

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
            Text("Attendance"),
          ],
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
                color: kOtherColor,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        color: kOtherColor,
                        boxShadow: [
                          BoxShadow(color: kTextLightColor, blurRadius: 2)
                        ]),
                    child: DChartPie(
                      data: [
                        {'domain': 'Present', 'measure': present},
                        {'domain': 'Absent', 'measure': absent},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'Present':
                            return Color.fromARGB(255, 16, 235, 129);
                          case 'Absent':
                            return kPrimaryColor;
                        }
                      },
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}:\n${pieData['measure']}%";
                      },
                      labelPosition: PieLabelPosition.auto,
                      donutWidth: 50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        color: kOtherColor,
                        boxShadow: [
                          BoxShadow(color: kTextLightColor, blurRadius: 2)
                        ]),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(kDefaultPadding),
                      children: [
                        SubAttendance(
                          subject: "Math",
                          PresentPercent: 73,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "DSA",
                          PresentPercent: 81,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "OS",
                          PresentPercent: 72,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "MCIOT",
                          PresentPercent: 79,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "Project",
                          PresentPercent: 91,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "Library",
                          PresentPercent: 78,
                        ),
                        sizedBox,
                        SubAttendance(
                          subject: "Python",
                          PresentPercent: 73,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubAttendance extends StatelessWidget {
  const SubAttendance(
      {super.key, required this.subject, required this.PresentPercent});
  final String subject;
  final double PresentPercent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subject,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 12, color: kTextBlackColor),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width / 1.5,
          child: DChartSingleBar(
            forgroundLabelAlign: Alignment.centerLeft,
            forgroundLabelPadding: EdgeInsets.only(left: 7),
            forgroundLabel: Text(PresentPercent.toString() + "%",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 13,
                    color: kTextBlackColor,
                    fontWeight: FontWeight.w600)),
            forgroundColor: kPrimaryColor,
            value: PresentPercent,
            max: 100,
            radius: BorderRadius.circular(kDefaultPadding),
          ),
        ),
      ],
    );
  }
}
