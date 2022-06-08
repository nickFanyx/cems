import 'package:cems/BLoC%20layer/Quarantine/UserBloc/add_daily_stat_bloc.dart';
import 'package:flutter/material.dart';

class UAddDailyStat extends StatefulWidget {
  const UAddDailyStat({Key? key}) : super(key: key);

  @override
  State<UAddDailyStat> createState() => _UAddDailyStatState();
}

enum Call { yes, no }

class _UAddDailyStatState extends State<UAddDailyStat> {
  AddDailyBloc dailyBloc = AddDailyBloc();

  bool fever = false;
  bool shivering = false;
  bool soreThroat = false;
  bool runnyNose = false;
  bool bodyAche = false;
  bool headache = false;

  Call? _called;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid-19 Daily Status'),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            '1. Are you exhibiting 2 or more symptoms as listed below?'),
                        Row(
                          children: [
                            Checkbox(
                              value: fever,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    fever = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Fever'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: shivering,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    shivering = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Shivering'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: soreThroat,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    soreThroat = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Sore Throat'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: runnyNose,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    runnyNose = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Runny Nose'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: bodyAche,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    bodyAche = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Body Ache'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: headache,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    headache = value!;
                                  },
                                );
                              },
                            ),
                            const Text('Headache'),
                          ],
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
                        const Text('2. Emergency Call'),
                        RadioListTile<Call>(
                          title: const Text('Yes'),
                          value: Call.yes,
                          groupValue: _called,
                          onChanged: (Call? value) {
                            setState(() {
                              _called = value;
                            });
                          },
                        ),
                        RadioListTile<Call>(
                          title: const Text('No'),
                          value: Call.no,
                          groupValue: _called,
                          onChanged: (Call? value) {
                            setState(() {
                              _called = value;
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
                    dailyBloc.addDaily(
                        "0148393272",
                        [
                          fever,
                          shivering,
                          soreThroat,
                          runnyNose,
                          bodyAche,
                          headache,
                        ],
                        _called == Call.yes ? true : false,
                        "Nik Ahmad Farihin");
                    showDialog<String>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Submitted!'),
                        content: Text(_called == Call.yes
                            ? 'Our MOH Staff will contact you within 3 minutes.\n\nPlease Dial 999 if there is no call.'
                            : 'Daily status submitted successfully.'),
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
