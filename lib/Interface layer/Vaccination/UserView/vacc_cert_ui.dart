import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VaccCert extends StatefulWidget {
  const VaccCert({Key? key}) : super(key: key);

  @override
  State<VaccCert> createState() => _VaccCertState();
}

class _VaccCertState extends State<VaccCert> {
  @override
  Widget build(BuildContext context) {
    String vaccine = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Certificate'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
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
                                    Text(
                                      'Fully Vaccinated?\n   Upload Your Certificate Here',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Card(
                                      color: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
