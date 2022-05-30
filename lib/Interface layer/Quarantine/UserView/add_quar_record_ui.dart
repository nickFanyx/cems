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
  Typee? _typed;
  Placee? _plate;
  CovRes? _res;
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
                            children: const [
                              Text('1.1 Justify your Symptoms'),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                decoration: InputDecoration(
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
                                children: const [
                                  Text(
                                      '1.1 If yes, Please fill in COVID-19 Patient Name'),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter patient name',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('1.2 COVID-19 Patient Phone No'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('2.1 Current Address'),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
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
                    Navigator.pop(context);
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
