import 'package:cems/BLoC%20layer/Movement/AdminBloc/view_mov_rec_bloc.dart';
import 'package:cems/Data%20layer/Movement/move_record.dart';
import 'package:flutter/material.dart';

class AViewMoveRecUI extends StatefulWidget {
  final MovementModel mvModel;
  const AViewMoveRecUI({Key? key, required this.mvModel}) : super(key: key);

  @override
  State<AViewMoveRecUI> createState() => _AViewMoveRecUIState();
}

class _AViewMoveRecUIState extends State<AViewMoveRecUI> {
  AViewMovRecBloc viewBloc = AViewMovRecBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movement Information'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Card(
                            color: viewBloc.getColor(widget.mvModel.movStatus),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Image(
                            image: viewBloc.getImage(widget.mvModel.movStatus),
                            width: 80,
                            height: 80,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            color: viewBloc.getColor(widget.mvModel.movStatus),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.mvModel.movStatus.toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                  'Location Name : ${widget.mvModel.locationName}'),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text('Name : ${widget.mvModel.name}'),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text('Phone No : ${widget.mvModel.userId}'),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text('Date : ${widget.mvModel.dateTime}'),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text('Risk Level : ${widget.mvModel.riskLevel}'),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                  'Vaccine Status : ${widget.mvModel.vacStatus}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 330,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Card(
              //   color: Colors.white,
              //   elevation: 10,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: SizedBox(
              //       width: 340,
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Row(
              //           children: [
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             Text('Location Name : ${widget.mvModel.locationName}'),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
