import 'package:flutter/material.dart';
import 'package:imkiran_me/Widget/CustomText.dart';

class WebAbout extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "01.",
                      textSize: 20.0,
                      color: Color.fromRGBO(25, 218, 15, 1),
                      letterSpacing: 0.10,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CustomText(
                      text: "About Me",
                      textSize: 26.0,
                      color: Color(0xffCCD6F6),
                      letterSpacing: 0.10,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 8,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "Hello! I'm Kiran, a Software Engineer(Backend) based in Bangalore, IN.\n\nI enjoy building things that live on the internet, whether that be websites, applications, or anything in between. My goal is to always build products that scales.\n\n",
                      textSize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                        text:
                            "I pursued my Bachlor's degree in Computer science and Engineering at University of VTU.\n\n",
                        textSize: 16.0,
                        color: Color(0xff828DAA),
                        letterSpacing: 0.75,
                        fontWeight: FontWeight.w400),
                    CustomText(
                        text:
                            "Here are a few technologies I've been working with recently:\n\n",
                        textSize: 16.0,
                        color: Color(0xff828DAA),
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 0.75,
                        fontWeight: FontWeight.w400),
                  ],
                ),

                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Golang"),
                            technology(context, "Java"),
                            technology(context, "Flutter"),
                            technology(context, "Docker and K8s"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "gRPC"),
                            technology(context, "MongoDB"),
                            technology(context, "MYSQL"),
                            technology(context, "AWS and GCP"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.10,
                    right: size.width * 0.11,
                    child: Card(
                      color: Color.fromRGBO(25, 218, 15, 0.5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff0A192F),
                        ),
                      ),
                    ),
                  ),
                  CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation();

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Color.fromRGBO(25, 218, 15, 1).withOpacity(0.15);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Color.fromRGBO(25, 218, 15, 1).withOpacity(0.15);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
              height: size.height / 2,
              width: size.width / 5,
              color: Colors.black54,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("images/imKiran.jpg"),
                  alignment: Alignment.center,
                ),
              )),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
