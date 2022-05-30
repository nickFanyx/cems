import 'package:flutter/material.dart';

class UManageQuarRec extends StatefulWidget {
  const UManageQuarRec({Key? key}) : super(key: key);

  @override
  State<UManageQuarRec> createState() => _UManageQuarRecState();
}

class _UManageQuarRecState extends State<UManageQuarRec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            color: Colors.redAccent,
          ),
          SizedBox(
            height: 20,
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
                      children: [
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
          SizedBox(
            height: 10,
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
                      children: [
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
}
