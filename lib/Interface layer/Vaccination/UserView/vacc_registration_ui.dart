// ignore_for_file: unused_import, unnecessary_import, implementation_imports

import 'package:cems/Interface%20layer/Vaccination/UserView/dependent_vacc_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_status_ui.dart';
import 'package:cems/BLoC layer/Vaccination/UserBloc/vacc_registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VaccRegister extends StatefulWidget {
  const VaccRegister({Key? key}) : super(key: key);

  @override
  State<VaccRegister> createState() => _VaccRegisterState();

  void vaccRegister(String s, bool bool, bool bool2, bool bool3, String t) {}
}

enum Interest { yes, no }

enum Disease { yes, no }

enum OKU { yes, no }

class _VaccRegisterState extends State<VaccRegister> {
  VaccRegister vaccRegisterBloc = const VaccRegister();

  Interest? _called;
  Disease? _disease;
  OKU? _oku;

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
                            width: 100,
                          ),
                          Text(
                            'Assessment',
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
                            const Text('1. Interested to take vaccination?'),
                            RadioListTile<Interest>(
                                title: const Text('Yes'),
                                value: Interest.yes,
                                groupValue: _called,
                                onChanged: (Interest? value) {
                                  setState(() {
                                    _called = value;
                                  });
                                }),
                            RadioListTile<Interest>(
                                title: const Text('No'),
                                value: Interest.no,
                                groupValue: _called,
                                onChanged: (Interest? value) {
                                  setState(() {
                                    _called = value;
                                  });
                                }),
                            const Text('2. Have any chronic disease?'),
                            RadioListTile<Disease>(
                                title: const Text('Yes'),
                                value: Disease.yes,
                                groupValue: _disease,
                                onChanged: (Disease? value) {
                                  setState(() {
                                    _disease = value;
                                  });
                                }),
                            RadioListTile<Disease>(
                                title: const Text('No'),
                                value: Disease.no,
                                groupValue: _disease,
                                onChanged: (Disease? value) {
                                  setState(() {
                                    _disease = value;
                                  });
                                }),
                            const Text('3. Are you registered as OKU?'),
                            RadioListTile<OKU>(
                                title: const Text('Yes'),
                                value: OKU.yes,
                                groupValue: _oku,
                                onChanged: (OKU? value) {
                                  setState(() {
                                    _oku = value;
                                  });
                                }),
                            RadioListTile<OKU>(
                                title: const Text('No'),
                                value: OKU.no,
                                groupValue: _oku,
                                onChanged: (OKU? value) {
                                  setState(() {
                                    _oku = value;
                                  });
                                }),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 50, 30, 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () {
                                  vaccRegisterBloc.vaccRegister(
                                      "01139003358",
                                      _called == Interest.yes ? true : false,
                                      _disease == Disease.no ? true : false,
                                      _oku == OKU.no ? true : false,
                                      "Sabrena Atira");
                                  showDialog<String>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title:
                                          const Text('Successfully Submitted!'),
                                      content: Text(_called == Interest.yes
                                          ? 'Please check your vaccination status from time to time for updates'
                                          : 'Protect yourself and others, get vaccinated!'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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
