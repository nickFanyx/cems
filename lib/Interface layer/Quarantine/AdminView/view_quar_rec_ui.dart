import 'package:cems/BLoC%20layer/Quarantine/AdminBloc/view_quar_rec_bloc.dart';
import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:flutter/material.dart';

class AViewRecUI extends StatefulWidget {
  final QuarantineModel qrModel;
  const AViewRecUI({Key? key, required this.qrModel}) : super(key: key);

  @override
  State<AViewRecUI> createState() => _AViewRecUIState();
}

enum result { ConfirmCase, LowRisk }

class _AViewRecUIState extends State<AViewRecUI> {
  AdViewQRRecbloc viewBloc = AdViewQRRecbloc();
  String response = "";
  result? _res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quarantine Information'),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 340,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Card(
                                  color: viewBloc
                                      .getColor(widget.qrModel.verifyResult),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      child: Text(
                                        'Day - ${viewBloc.daysBetween(widget.qrModel.dateTime, DateTime.now())}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )),
                              Icon(
                                Icons.hourglass_bottom_outlined,
                                size: 70,
                                color: viewBloc
                                    .getColor(widget.qrModel.verifyResult),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 250,
                                child: Center(
                                  child: Text(
                                    widget.qrModel.staffResponse.isEmpty
                                        ? "No response yet"
                                        : widget.qrModel.staffResponse,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: viewBloc.getColor(
                                          widget.qrModel.verifyResult),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                color: viewBloc
                                    .getColor(widget.qrModel.verifyResult),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.qrModel.verifyResult.toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Name : ${widget.qrModel.username}'),
                        ],
                      ),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Test Result : ${widget.qrModel.testResult}'),
                        ],
                      ),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              '${widget.qrModel.quarantinePlace} : ${widget.qrModel.quarantineAddress}'),
                        ],
                      ),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Type : ${widget.qrModel.usertype}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              widget.qrModel.usertype == "Symptoms"
                  ? Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 340,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Details : ${widget.qrModel.symptomsDetail}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 340,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        'Name : ${widget.qrModel.patientName}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('No : ${widget.qrModel.patientNo}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              widget.qrModel.verifyResult == "Not Verify"
                  ? Column(
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 340,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Verify Result?'),
                                    RadioListTile<result>(
                                      title: const Text('Confirmed Case'),
                                      value: result.ConfirmCase,
                                      groupValue: _res,
                                      onChanged: (result? value) {
                                        setState(() {
                                          _res = value;
                                        });
                                      },
                                    ),
                                    RadioListTile<result>(
                                      title: const Text('Low Risk'),
                                      value: result.LowRisk,
                                      groupValue: _res,
                                      onChanged: (result? value) {
                                        setState(() {
                                          _res = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 340,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Give response to patient:'),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      onChanged: (value) => response = value,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Response',
                                      ),
                                    )
                                  ],
                                ),
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
                              viewBloc.verifyRes(
                                widget.qrModel.recordid,
                                _res == result.ConfirmCase
                                    ? "Confirmed Case"
                                    : "Low Risk",
                                response,
                              );
                              showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Verified!'),
                                  content: const Text('Record verified!'),
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
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
