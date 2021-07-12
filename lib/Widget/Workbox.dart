import 'package:flutter/material.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "SmartClean Technologies (India)",
          subTitle: "Team Lead (Backend) (Full-time)",
          duration: "Apr 2021 - Present",
        ),
        WorkCustomData(
          title: "SmartClean Technologies (India)",
          subTitle: "Senior Software Engineer (Full-time)",
          duration: "Mar 2020 - Apr 2021",
        ),
        WorkCustomData(
          title: "Youplus, Inc (India)",
          subTitle: "Software Engineer (Full-time)",
          duration: "Feb 2016 - Mar 2020",
        ),
      ],
    );
  }
}
