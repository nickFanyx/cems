// ignore_for_file: unused_import

import 'package:cems/Interface%20layer/Vaccination/UserView/dependent_status_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/dependent_vacc_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_cert_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_registration_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_type_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CheckStatus extends StatefulWidget {
  const CheckStatus({Key? key}) : super(key: key);

  @override
  State<CheckStatus> createState() => CheckStatusState();
}

class CheckStatusState extends State<CheckStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vaccination Status'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.redAccent,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 90,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/addquar.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Check Status',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DependentStatus(),
                              ),
                            ),
                          },
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 90,
                                child: Row(children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/dependent.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Dependent Status',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VaccCert(),
                              ),
                            ),
                          },
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 90,
                                child: Row(children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/upload.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Upload Certificate',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VaccType(),
                              ),
                            ),
                          },
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 90,
                                child: Row(children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/vaccine.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Vaccination Registration',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DependentVacc(),
                              ),
                            ),
                          },
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 90,
                                child: Row(children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/dependent.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Dependent Vaccination',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
