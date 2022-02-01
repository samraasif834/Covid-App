import 'package:covidapp/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String Country = "pakistan";
String searchedCountry = '';

TextEditingController search = TextEditingController();



class goback extends StatefulWidget {
  const goback({ Key? key }) : super(key: key);

  @override
  _gobackState createState() => _gobackState();
}

class _gobackState extends State<goback> {

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("go to search page"),
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homescreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("You have entered wrong country"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

