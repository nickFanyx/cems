import 'dart:ui';

import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_registration_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VaccType extends StatefulWidget {
  const VaccType({Key? key}) : super(key: key);

  @override
  State<VaccType> createState() => _VaccTypeState();
}

class _VaccTypeState extends State<VaccType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vaccination Registration'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
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
                        height: 50,
                        child: Row(children: const [
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            'Vaccination Type',
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                      ),
                    ),
                  )),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 340,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '1.Register for Standard vaccination',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 80, 30, 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VaccRegister(),
                                    ),
                                  ),
                                },
                                child: const Text('Register'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 80, 30, 10),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 340,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '2.Register for Booster vaccination',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 80, 30, 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VaccRegister(),
                                    ),
                                  ),
                                },
                                child: const Text('Register'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ));
  }
}
