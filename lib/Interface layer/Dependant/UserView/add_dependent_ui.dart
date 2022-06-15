import 'package:cems/Interface%20layer/Dependant/UserView/add_dependent_ui.dart';
import 'package:cems/BLoC%20layer/Dependant/UserBloc/add_dependent_bloc.dart';
import 'package:cems/home.dart';
import 'package:cems/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    final UserBloc userBloc = UserBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('Add Dependent'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
              create: (_) => userBloc,
              child:  ListView(
                children: [
                  const SizedBox(height: 30,),
                  Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 10, right: 10,top: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Full name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter full name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _age,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Dependent Type',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                TextFormField(
                                  controller: _age,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Age',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                
                                TextFormField(
                                  controller: _age,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Choose your gender',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                TextFormField(
                                  controller: _age,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your address',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      70, 30, 70, 10),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        //add to model
                                        UserModel userModel = UserModel(
                                            name: _name.text,
                                            age: int.parse(_age.text));

                                        //add to bloc
                                        userBloc
                                            .add(InsertUserData(userModel));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Data Added Successfully'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),),
        ),
      ),
    );
  }
}
