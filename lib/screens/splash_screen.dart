import 'dart:async';

import 'package:covidapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homescreen1()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 51, 44, 1.0),
        body: Stack(
          children: [
            Positioned(
                top: 10,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/img1.png'))),
            Positioned(
              top: 230,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/img2.png'),
              ),
            ),
            Positioned(
              top: 150,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text("Be Aware",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("From Covid-19",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
            Positioned(
              top: 250,
              left: 20,
              child: Container(
                  child: Text("Keep Yourself Home Quarantined",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white38,
                      ))),
            ),
            Positioned(
              top: 10,
              left: -90,
              child: Container(
                child: Image.asset(
                  'assets/images/img3.png',
                  width: 500,
                  height: 900,
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 100,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                  child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'Covid-19 Statistics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              )),
            ),
          ],
        ));
  }
}
