import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imkiran_me/Widget/CustomText.dart';
import 'package:imkiran_me/Widget/Workbox.dart';

class WebWork extends StatefulWidget {
  @override
  _WebWorkState createState() => _WebWorkState();
}

class _WebWorkState extends State<WebWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "02.",
                textSize: 20.0,
                color: Color.fromRGBO(25, 218, 15, 1),
                letterSpacing: 0.10,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: 12.0,
              ),
              CustomText(
                text: "Where I've Worked",
                textSize: 26.0,
                color: Color(0xffCCD6F6),
                letterSpacing: 0.10,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width / 4,
                height: 1.10,
                color: Color(0xff303C55),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: size.height * 1,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        Center(
                          child: VerticalDivider(
                            color: Color.fromRGBO(25, 218, 15, 1),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink,
                                child: FaIcon(FontAwesomeIcons.dev,
                                    color: Colors.white),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                child: FaIcon(FontAwesomeIcons.dev,
                                    color: Colors.white),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.brown,
                                child: FaIcon(FontAwesomeIcons.dev,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                        )
                      ],
                    )),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    height: size.height,
                    child: WorkBox(),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
