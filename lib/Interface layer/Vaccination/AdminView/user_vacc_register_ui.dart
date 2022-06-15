import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserVaccRegister extends StatefulWidget {
  const UserVaccRegister({Key? key}) : super(key: key);

  @override
  State<UserVaccRegister> createState() => _UserVaccRegisterState();
}

class _UserVaccRegisterState extends State<UserVaccRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.white,
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
                              width: 290,
                              height: 50,
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'User Vaccination Registration',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Container(
                      color: Colors.white,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => {},
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
                                  image: AssetImage('assets/images/person.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '\t\tPerson 1',
                                  style: TextStyle(fontSize: 20),
                                ),
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
                                      Image(
                                        image: AssetImage(
                                            'assets/images/person.png'),
                                        width: 50,
                                        height: 50,
                                      ),
                                      Text(
                                        '\t\tPerson 2',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  )))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
