import 'package:flutter/material.dart';

import 'mov_history_ui.dart';
import 'choose_dependents_ui.dart';
import 'checkout_dashboard_ui.dart';

class UCheckInRec extends StatefulWidget {
  const UCheckInRec({Key? key}) : super(key: key);

  @override
  State<UCheckInRec> createState() => _UCheckInRecState();
}

class _UCheckInRecState extends State<UCheckInRec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/cemsicon.png",
              width: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
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
                                  text: "Kedai Pak Mat",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nDec 12, 2021, 11:06:40 PM",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 152, 168),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UCheckOutRec(),
                                ),
                              );
                            },
                            child: const Text(
                              "Check-out",
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: InkWell(
                child: const Text(
                  'History',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UMovHistoryRec(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  maximumSize: const Size(200, 60),
                  backgroundColor: const Color.fromARGB(255, 255, 100, 124),
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UChooseDep(),
                    ),
                  );
                },
                child: const Text(
                  "CHECK-IN",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
