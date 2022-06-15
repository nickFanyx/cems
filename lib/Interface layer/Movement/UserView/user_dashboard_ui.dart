import 'package:flutter/material.dart';

class UMovDashboard extends StatefulWidget {
  const UMovDashboard({Key? key}) : super(key: key);

  @override
  State<UMovDashboard> createState() => _UMovDashboardState();
}

class _UMovDashboardState extends State<UMovDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEMS'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/success.png",
                  width: 200,
                ),
                const Divider(
                  height: 30,
                  thickness: 1,
                  indent: 10,
                  endIndent: 0,
                  color: Color.fromARGB(34, 0, 0, 0),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Check-in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(215, 0, 0, 0)),
                  ),
                ),
                const Divider(
                  height: 30,
                  thickness: 1,
                  indent: 10,
                  endIndent: 0,
                  color: Color.fromARGB(34, 0, 0, 0),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1.0,
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                            image: AssetImage('assets/images/location.png'),
                            width: 50,
                            height: 80,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: const TextSpan(
                                  text: 'wellness\n',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Kedai Pak Cik",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nAlways Stay Vigilant & Safe.",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'wellness\n',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Name",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nNurin Azyyati Binti Kamilizahri",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Phone No",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n+60123456789",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Date",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "\nDec 12, 2021",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Time",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "\n11:06:40 PM",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 251, 138, 25),
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Low Risk",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 88, 221, 103),
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Fully Vaccinated",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
