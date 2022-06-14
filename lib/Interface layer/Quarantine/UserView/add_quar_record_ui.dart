// ignore_for_file: constant_identifier_names

import 'package:cems/BLoC%20layer/Quarantine/UserBloc/add_quar_record_bloc.dart';
import 'package:flutter/material.dart';

class UAddQuarRec extends StatefulWidget {
  const UAddQuarRec({Key? key}) : super(key: key);

  @override
  State<UAddQuarRec> createState() => _UAddQuarRecState();
}

enum Typee { Symptoms, CloseContact }

enum Placee { Home, QuarantinePlace }

enum CovRes { Positive, Negative }

class _UAddQuarRecState extends State<UAddQuarRec> {
  AddQuarRecordBloc addQuarRecordBloc = AddQuarRecordBloc();

  String symptom = "", patientName = "", patientPhone = "", currAdd = "";
  Typee? _typed;
  Placee? _plate;
  CovRes? _res;
  bool validType = false, validPlace = false, validRes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Quarantine Record'),
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
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('1. User Type?'),
                        RadioListTile<Typee>(
                          title: const Text('Symptoms'),
                          value: Typee.Symptoms,
                          groupValue: _typed,
                          onChanged: (Typee? value) {
                            setState(() {
                              _typed = value;
                            });
                          },
                        ),
                        RadioListTile<Typee>(
                          title: const Text('Close Contact'),
                          value: Typee.CloseContact,
                          groupValue: _typed,
                          onChanged: (Typee? value) {
                            setState(() {
                              _typed = value;
                            });
                          },
                        ),
                        validType == false
                            ? const SizedBox()
                            : const Text(
                                "Plesea Select Type!",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
              _typed == Typee.Symptoms
                  ? Card(
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
                              const Text('1.1 Justify your Symptoms'),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                onChanged: (value) => symptom = value,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Symptoms',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : _typed == Typee.CloseContact
                      ? Card(
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
                                      '1.1 If yes, Please fill in COVID-19 Patient Name'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    onChanged: (value) => patientName = value,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter patient name',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('1.2 COVID-19 Patient Phone No'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) => patientPhone = value,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '(eg 60XXX-XXXXXXX)',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
              const SizedBox(
                height: 5,
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
                        const Text('2. Current Quarantine Place'),
                        RadioListTile<Placee>(
                          title: const Text('Home'),
                          value: Placee.Home,
                          groupValue: _plate,
                          onChanged: (Placee? value) {
                            setState(() {
                              _plate = value;
                            });
                          },
                        ),
                        RadioListTile<Placee>(
                          title: const Text('Quarantine Center'),
                          value: Placee.QuarantinePlace,
                          groupValue: _plate,
                          onChanged: (Placee? value) {
                            setState(() {
                              _plate = value;
                            });
                          },
                        ),
                        validPlace == false
                            ? const SizedBox()
                            : const Text(
                                "Plesea Select Place!",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('2.1 Current Address'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => currAdd = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Address',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                            '3. Covid-19 Self Test/ RTK-Antigen / PCR Test Result'),
                        RadioListTile<CovRes>(
                          title: const Text('Positive'),
                          value: CovRes.Positive,
                          groupValue: _res,
                          onChanged: (CovRes? value) {
                            setState(() {
                              _res = value;
                            });
                          },
                        ),
                        RadioListTile<CovRes>(
                          title: const Text('Negative'),
                          value: CovRes.Negative,
                          groupValue: _res,
                          onChanged: (CovRes? value) {
                            setState(() {
                              _res = value;
                            });
                          },
                        ),
                        validRes == false
                            ? const SizedBox()
                            : const Text(
                                "Plesea Select Result!",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  onPressed: () {
                    if (_typed == null) {
                      setState(() {
                        validType = true;
                      });
                    } else {
                      setState(() {
                        validType = false;
                      });
                    }
                    if (_plate == null) {
                      setState(() {
                        validPlace = true;
                      });
                    } else {
                      setState(() {
                        validPlace = false;
                      });
                    }
                    if (_res == null) {
                      setState(() {
                        validRes = true;
                      });
                    } else {
                      setState(() {
                        validRes = false;
                      });
                    }
                    if (validPlace == false &&
                        validRes == false &&
                        validType == false) {
                      addQuarRecordBloc.addRecord(
                        "0148393272",
                        _typed == Typee.Symptoms ? "Symptoms" : "Close Contact",
                        symptom,
                        patientName,
                        patientPhone,
                        _plate == Placee.Home ? "Home" : "Quarantine Center",
                        currAdd,
                        _res == CovRes.Positive ? "Positive" : "Negative",
                        "Nik Ahmad Farihin",
                      );
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Added!'),
                          content: const Text(
                              'Quarantine Record Added Successfully!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'SUBMIT',
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
    );
  }
}
