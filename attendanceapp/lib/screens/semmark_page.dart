import 'package:attendanceapp/screens/mark.dart';
import 'package:attendanceapp/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class SemMarkPage extends StatelessWidget {
  const SemMarkPage({super.key});

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
            Text("Results"),
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
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: mark.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(kDefaultPadding)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: kTextLightColor, blurRadius: 2)
                              ],
                            ),
                            child: Column(
                              children: [
                                Semdetails(
                                    Title: "Semester",
                                    Details: mark[index].semno),
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Semdetails(
                                    Title: "Math", Details: mark[index].sub1),
                                sizedBox,
                                Semdetails(
                                    Title: "DSA", Details: mark[index].sub2),
                                sizedBox,
                                Semdetails(
                                    Title: "OS", Details: mark[index].sub3),
                                sizedBox,
                                Semdetails(
                                    Title: "MCIOT", Details: mark[index].sub4),
                                sizedBox,
                                SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Semdetails(
                                    Title: "Result",
                                    Details: mark[index].result),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //Download pdf
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [kSecondaryColor, kPrimaryColor],
                                  begin: const FractionalOffset(0, 0),
                                  end: const FractionalOffset(0.5, 0),
                                  stops: [0, 1],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(kDefaultPadding),
                                  bottomRight: Radius.circular(kDefaultPadding),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Download",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                  ),
                                  SizedBox(
                                    width: kDefaultPadding / 2,
                                  ),
                                  Icon(
                                    Icons.arrow_circle_down,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class Semdetails extends StatelessWidget {
  const Semdetails({super.key, required this.Title, required this.Details});
  final String Title;
  final String Details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Title,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 14, color: kTextLightColor),
        ),
        Text(
          Details,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 14,
                color: kTextBlackColor,
                fontWeight: FontWeight.w600,
              ),
        )
      ],
    );
  }
}
