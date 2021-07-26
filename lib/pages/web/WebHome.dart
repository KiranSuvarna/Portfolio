import 'package:flutter/material.dart';
import 'package:imkiran_me/pages/web/WebAbout.dart';
import 'package:imkiran_me/pages/web/WebWork.dart';
import 'package:imkiran_me/utils/Method.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imkiran_me/widget/AppBarTitle.dart';
import 'package:imkiran_me/widget/CustomText.dart';
import 'package:imkiran_me/widget/FeatureProject.dart';
import 'package:imkiran_me/widget/MainTitle.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);

  @override
  _WebHomeState createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpanded = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpanded != false
                ? setState(
                    () {
                      isExpanded = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpanded != true
                ? setState(() {
                    print('setState is called');
                    isExpanded = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Navigation Bar
              Container(
                  height: size.height * 0.14,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.phoenixSquadron,
                            color: Color.fromRGBO(25, 218, 15, 1),
                            size: 32.0,
                          ),
                          onPressed: () {
                            //return WebHome();
                          },
                        ),
                        Spacer(),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: DefaultTabController(
                              length: 4,
                              child: TabBar(
                                  indicatorColor: Colors.transparent,
                                  onTap: (index) async {
                                    _scrollToIndex(index);
                                  },
                                  tabs: [
                                    Tab(
                                        child: AppBarTitle(
                                      text: "About",
                                    )),
                                    Tab(
                                      child: AppBarTitle(text: "Experience"),
                                    ),
                                    Tab(
                                        child:
                                            AppBarTitle(text: "Certificate")),
                                    Tab(child: AppBarTitle(text: "Contact Me")),
                                  ])),
                        )),
                        FloatingActionButton.extended(
                          backgroundColor: Color.fromRGBO(25, 218, 15, 1),
                          hoverElevation: 50.0,
                          onPressed: () {
                            method.launchURL(
                                "https://drive.google.com/file/d/1YnVivMUBV2RQxp2kk4ZbVvnorD5EbsNN/view");
                          },
                          label: Text("Resume"),
                        ),
                      ],
                    ),
                  )),

              Row(
                // Social Icon
                children: [
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            method.launchURL("https://github.com/KiranSuvarna");
                          },
                          icon: FaIcon(FontAwesomeIcons.github),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.twitter),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://twitter.com/imKiranSuvarna");
                            }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/imkiran/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://www.instagram.com/imkiransuvarna/");
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate([
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height * .06,
                                    ),
                                    CustomText(
                                      text: "Hi, my name is",
                                      textSize: 16.0,
                                      color: Color.fromRGBO(25, 218, 15, 1),
                                      letterSpacing: 3.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    CustomText(
                                      text: "Kiran Suvarna",
                                      textSize: 68.0,
                                      color: Color.fromRGBO(25, 218, 15, 1),
                                      letterSpacing: 3.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: 4.0),
                                    CustomText(
                                      text:
                                          "I'm a Software Engineer and I love to build a product that touches millions of people.",
                                      textSize: 56.0,
                                      color: Color(0xffCCD6F6).withOpacity(0.6),
                                      letterSpacing: 0.10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      height: size.height * .04,
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          " I would like to combine my passion for technology with my software development skills to continue building products.",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16.0,
                                            letterSpacing: 2.75,
                                            wordSpacing: 0.75,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .12,
                                    ),

                                    // Get in touch
                                    InkWell(
                                      onTap: () {
                                        method.launchEmail();
                                      },
                                      hoverColor:
                                          Color(0xff64FFDA).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.09,
                                        width: size.width * 0.14,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Color.fromRGBO(25, 218, 15, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Text(
                                          "Get in Touch",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(25, 218, 15, 1),
                                            letterSpacing: 2.75,
                                            wordSpacing: 1.0,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.20,
                                    )
                                  ],
                                ),
                                _wrapScrollTag(
                                  index: 0,
                                  child: WebAbout(),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),

                                // Work
                                _wrapScrollTag(
                                  index: 1,
                                  child: WebWork(),
                                ),
                                SizedBox(
                                  height: size.height * 0.10,
                                ),

                                // Certificates
                                _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "03.",
                                        text: "Certificates",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        imagePath:
                                            "images/Docker_Kubernetes.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://udemy-certificate.s3.amazonaws.com/pdf/UC-4182be78-effb-411d-bfb6-1892c8589e87.pdf");
                                        },
                                        projectDesc:
                                            "Docker and Kubernetes: The Complete Guide",
                                        projectTitle: "",
                                        tech1: "Docker",
                                        tech2: "Kubernetes",
                                        tech3: "Udemy",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/gRPC.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://udemy-certificate.s3.amazonaws.com/pdf/UC-6550620e-65ba-437f-b0c8-24bf146d9671.pdf");
                                        },
                                        projectDesc:
                                            "gRPC [Golang] Master Class: Build Modern API & Microservices",
                                        projectTitle: "",
                                        tech1: "",
                                        tech2: "Golang",
                                        tech3: "Udemy",
                                      ),
                                      FeatureProject(
                                        imagePath:
                                            "images/Protocol_Buffers.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://udemy-certificate.s3.amazonaws.com/image/UC-e64b4561-5fc2-41d3-87a0-9c04437a51f5.jpg");
                                        },
                                        projectDesc:
                                            "Complete Guide to Protocol Buffers 3 [Golang]",
                                        projectTitle: "",
                                        tech1: "Java",
                                        tech2: "Golang",
                                        tech3: "Udemy",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/Android.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://graduation.udacity.com/confirm/VPGPCNKH");
                                        },
                                        projectDesc:
                                            "Android developer Nanodegree Graduate",
                                        projectTitle: "",
                                        tech1: "Java",
                                        tech2: "Udacity",
                                        tech3: "",
                                      ),
                                    ],
                                  ),
                                ),

                                // Get in Touch
                                _wrapScrollTag(
                                  index: 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Get In Touch",
                                              textSize: 42.0,
                                              color: Colors.white,
                                              letterSpacing: 3.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            SizedBox(
                                              height: 16.0,
                                            ),
                                            SizedBox(
                                              height: 32.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                method.launchEmail();
                                              },
                                              child: Card(
                                                elevation: 4.0,
                                                color: Color.fromRGBO(
                                                    25, 218, 15, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.all(0.85),
                                                  height: size.height * 0.09,
                                                  width: size.width * 0.10,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff0A192F),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8.0,
                                                    ),
                                                    child: Text(
                                                      "Say Hello",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            25, 218, 15, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      //Footer
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        //color: Colors.white,
                                        child: Text(
                                          "Designed & Built by Tushar Nikam",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            letterSpacing: 1.75,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "kiransuvarnahm@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
