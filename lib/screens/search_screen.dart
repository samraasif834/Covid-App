import 'package:covidapp/models/home_screen_model.dart';
import 'package:covidapp/screens/splash_screen.dart';
import 'package:covidapp/screens/variable.dart';
import 'package:covidapp/service/home_screen_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bottom_navigation.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}
DateTime currentdate = new DateTime.now();
class _SearchState extends State<Search> {
  String formatdate = new DateFormat('MMMMEEEEd').format(currentdate);
  String formatdate1 = DateFormat(' hh:mm a').format(currentdate);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ), 
        body: FutureBuilder(
            future: getApi('$Country'),
            builder: (context, AsyncSnapshot<Covidmodel> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              if (snapshot.data == null) {
                return goback();
              } else
                return Stack(
                children: [
                     Positioned(
                   
                    left: 7,
                    child: Container(
                      height: 40,
                      width: 350,
                      child: TextField(
                        controller: search,
                        onChanged: (value) {
                          if (Country != null) {
                            setState(() {
                              Country == searchedCountry;
                              Country = search.text;
                              print(Country);
                            });
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(
                                    179,
                                    217,
                                    209,
                                    1.0,
                                  ),
                                  width: 5.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(251, 207, 192, 1.0),
                            ),
                            hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 7,
                    child: Container(
                      child: Text(
                        "Current Outbreak",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                
                  Positioned(
                    top: 68,
                    left: 7,
                    child: Container(
                      child: Text(
                        "$Country",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 7,
                    child: Container(
                      child: Text(
                        '$formatdate',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 7,
                    child: Container(
                        height: 120,
                        width: 396.5,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(179, 217, 209, 1.0),
                            border: Border.all(
                              color: Color.fromRGBO(179, 217, 209, 1.0),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -55,
                              bottom: 5,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Image.asset('assets/images/img4.png'),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 130,
                              child: Container(
                                child: Text(
                                  "Self Check up Covid-19",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 130,
                              child: Container(
                                child: Text(
                                  'Contain Several list of Quesion \nto check your physical Conition',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 55,
                                left: 335,
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_right_sharp,
                                    size: 40,
                                  ),
                                )),
                          ],
                        )),
                  ),
                  Positioned(
                      top: 270,
                      left: 7,
                      child: Container(
                        child: Text(
                          "Covid-19 Latest Update",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )),
                  Positioned(
                      top: 300,
                      left: 7,
                      child: Container(
                        child: Text(
                          "Last Update $formatdate1",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )),
                  Positioned(
                      top: 300,
                      right: 7,
                      child: Container(
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )),
                  Positioned(
                      top: 350,
                      right: 1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              child: Container(
                                height: 120,
                                width: 178,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(251, 207, 192, 1.0),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(251, 207, 192, 1.0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Align(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.masks_rounded,
                                              size: 30,
                                              color: Color.fromRGBO(
                                                  205, 160, 145, 1.0),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${snapshot.data!.cases}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromRGBO(180, 108, 85, 1.0),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Cases",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Align(
                              child: Container(
                                height: 120,
                                width: 178,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(250, 193, 208, 1.0),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(250, 193, 208, 1.0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Align(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(Icons.clear_sharp,
                                                size: 30,
                                                color: Color.fromRGBO(
                                                    177, 111, 89, 1.0))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${snapshot.data!.deaths}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromRGBO(180, 108, 85, 1.0),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Deaths",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Positioned(
                      top: 500,
                      right: -4,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(179, 217, 209, 1.0),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(179, 217, 209, 1.0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Align(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.warning,
                                              size: 30,
                                              color: Color.fromRGBO(
                                                  205, 160, 145, 1.0),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${snapshot.data!.critical}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromRGBO(180, 108, 85, 1.0),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Critical",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Align(
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(179, 217, 209, 1.0),
                                    border: Border.all(
                                      color: Color.fromRGBO(179, 217, 209, 1.0),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Align(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: Icon(Icons.favorite,
                                                size: 30,
                                                color: Color.fromRGBO(
                                                    210, 56, 97, 1.0))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${snapshot.data!.recovered}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromRGBO(210, 56, 97, 1.0),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Recovered",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Align(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(179, 217, 209, 1.0),
                                      border: Border.all(
                                        color:
                                            Color.fromRGBO(179, 217, 209, 1.0),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Align(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.check_rounded,
                                                  size: 30,
                                                  color: Color.fromRGBO(
                                                      177, 111, 89, 1.0))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          "${snapshot.data!.active}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(
                                                180, 108, 85, 1.0),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Active",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              );
                
                //  Stack(children: [
                  // Positioned(
                  //   top: 50,
                  //   left: 25,
                  //   child: Container(
                  //     height: 40,
                  //     width: 350,
                  //     child: TextField(
                  //       controller: search,
                  //       onChanged: (value) {
                  //         if (Country != null) {
                  //           setState(() {
                  //             Country == searchedCountry;
                  //             Country = search.text;
                  //             print(Country);
                  //           });
                  //         }
                  //       },
                  //       decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: Color.fromRGBO(
                  //                   179,
                  //                   217,
                  //                   209,
                  //                   1.0,
                  //                 ),
                  //                 width: 5.0),
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           ),
                  //           filled: true,
                  //           hintStyle: TextStyle(
                  //             color: Color.fromRGBO(251, 207, 192, 1.0),
                  //           ),
                  //           hintText: "Type in your text",
                  //           fillColor: Colors.white),
                  //     ),
                  //   ),
                  // ),
                //   Positioned(
                //       top: 100,
                //       child: Container(
                //         height: 150,
                //         width: 180,
                //         child: ListTile(
                //           title: Text('${snapshot.data!.cases}'),
                //         ),
                //       )),
                // ]);
            }),
              bottomNavigationBar: Bottomnavigation(),
            );
  }

  Widget goback() {
    return Container(
        child: Row(
      children: [
        ElevatedButton(
            onPressed: () {}, child: Text("you have enetered wrong country")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Homescreen()));
            },
            child: Text("Go to search screen")),
      ],
    ));
  }
}
