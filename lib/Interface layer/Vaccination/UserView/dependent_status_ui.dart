import 'package:cems/Interface%20layer/Vaccination/UserView/check_status_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_status_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DependentStatus extends StatefulWidget {
  const DependentStatus({Key? key}) : super(key: key);

  @override
  State<DependentStatus> createState() => _DependentStatusState();
}

class _DependentStatusState extends State<DependentStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dependent Status'),
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
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Vaccination(),
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
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/person.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Person 1',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                                builder: (context) => const Vaccination(),
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
                                        AssetImage('assets/images/person.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Person 2',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                              )),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
