import 'package:demo_website/models/models.dart';
import 'package:demo_website/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  var animation;
  var animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    animation = Tween(begin: -0.25, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final List<HeaderItem> headerItems = [
      HeaderItem(
        title: 'HOME',
        onTap: () {
          if (Uri.base.path != '/home') {
            Navigator.pushNamed(context, '/home');
          }
        },
        isButton: false,
      ),
      HeaderItem(
        title: 'ABOUT',
        onTap: () {
          if (Uri.base.path != '/about') {
            Navigator.pushNamed(context, '/about');
          }
        },
        isButton: false,
      ),
      HeaderItem(
        title: 'PROJECTS',
        onTap: () {
          if (Uri.base.path != '/projects') {
            Navigator.pushNamed(context, '/projects');
          }
        },
        isButton: false,
      ),
      HeaderItem(
        title: 'CONTACT',
        onTap: () {
          if (Uri.base.path != '/contact') {
            Navigator.pushNamed(context, '/contact');
          }
        },
        isButton: false,
      ),
      HeaderItem(
        title: 'RESUME',
        onTap: () {
          Navigator.pushNamed(context, '/resume');
        },
        isButton: true,
      ),
    ];

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform:
              Matrix4.translationValues(0.0, animation.value * height, 0.0),
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 16.0),
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: width * 0.1),
                width: width,
                color: kPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: headerItems
                      .map(
                        (element) => element.isButton
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.0),
                                child: InkWell(
                                  splashColor: kPrimaryColor,
                                  onTap: element.onTap,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Container(
                                      color: kBackgroundColor,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.0,
                                        horizontal: 30,
                                      ),
                                      child: Text(
                                        element.title,
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.0),
                                child: TextButton(
                                  onPressed: element.onTap,
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(25.0),
                                    primary: Colors.white,
                                    textStyle: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      decoration: Uri.base.path ==
                                              '/' + element.title.toLowerCase()
                                          ? TextDecoration.underline
                                          : null,
                                    ),
                                  ),
                                  child: Text(element.title),
                                ),
                              ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
