import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserVaccination extends StatefulWidget {
  const UserVaccination({Key? key}) : super(key: key);

  @override
  State<UserVaccination> createState() => _UserVaccinationState();
}

class _UserVaccinationState extends State<UserVaccination> {
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
                        onTap: () => {},
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
                                'User Vaccination',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ),
                      ),
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
                                      image: AssetImage(
                                          'assets/images/person.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\t\tPerson 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                    Icon(
                                      Icons.delete_forever_sharp,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ],
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                                  '\t\tPerson 2\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                                Icon(
                                  Icons.delete_forever_sharp,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
