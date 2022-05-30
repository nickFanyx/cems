import 'package:cems/Interface%20layer/Quarantine/UserView/add_daily_stat_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/add_quar_record_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/view_quar_rec_ui.dart';
import 'package:flutter/material.dart';

class UManageQuarRec extends StatefulWidget {
  const UManageQuarRec({Key? key}) : super(key: key);

  @override
  State<UManageQuarRec> createState() => _UManageQuarRecState();
}

class _UManageQuarRecState extends State<UManageQuarRec> {
  List listDisplay = [
    {
      'id': '1',
      'userType': 'Symptom',
      'timeStamp': 'March 10,2021 at 10:57 pm ',
    },
    {
      'id': '2',
      'userType': 'Close Contact',
      'timeStamp': 'December 10,2022 at 11:57 am ',
    },
    {
      'id': '3',
      'userType': 'Close Contact',
      'timeStamp': 'December 10,2022 at 11:57 am ',
    },
    {
      'id': '4',
      'userType': 'Symptom',
      'timeStamp': 'December 10,2022 at 11:57 am ',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Quarantine Record List',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 320,
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return listitem(index);
                }),
                itemCount: listDisplay.length,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UAddQuarRec(),
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
                          image: AssetImage('assets/images/addquar.png'),
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Quarantine Record',
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
                    builder: (context) => const UAddDailyStat(),
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
                          image: AssetImage('assets/images/cov.png'),
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Covid-19 Daily Record',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  listitem(index) {
    return Card(
      color: Colors.redAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UViewQuarRec(),
            ),
          ),
        },
        child: SizedBox(
          width: 300,
          height: 90,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: AssetImage('assets/images/addquar.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    listDisplay[index]['userType'],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    listDisplay[index]['timeStamp'],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
