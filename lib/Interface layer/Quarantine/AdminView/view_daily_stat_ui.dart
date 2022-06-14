import 'package:cems/BLoC%20layer/Quarantine/AdminBloc/view_daily_bloc.dart';
import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class ViewDailyStat extends StatefulWidget {
  final DailyRec dailyModel;
  const ViewDailyStat({Key? key, required this.dailyModel}) : super(key: key);

  @override
  State<ViewDailyStat> createState() => _ViewDailyStatState();
}

class _ViewDailyStatState extends State<ViewDailyStat> {
  ViewDailyBloc viewBloc = ViewDailyBloc();
  bool _hasCallSupport = false;
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Status Details'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Alert!'),
                  content:
                      const Text('Are you sure to delete this daily status?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'NO');
                      },
                      child: const Text('NO'),
                    ),
                    TextButton(
                      onPressed: () {
                        viewBloc.deleteStat(widget.dailyModel.dailyId);
                        Navigator.pop(context, 'YES');
                        Navigator.pop(context);
                      },
                      child: const Text('YES'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              widget.dailyModel.emergencyCall == true
                  ? const Icon(
                      Icons.call_rounded,
                      size: 200,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 200,
                      color: Colors.green,
                    ),
              widget.dailyModel.emergencyCall == true
                  ? const Text(
                      'Emergency call needed!',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'Daily Status Updated!',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Name : ${widget.dailyModel.userName}'),
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
                          Text('No : ${widget.dailyModel.userId}'),
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
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text('Symptoms'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: sympTom(widget.dailyModel.symptomsList),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched =
                              viewBloc.makePhoneCall(widget.dailyModel.userId);
                        })
                    : null,
                child: _hasCallSupport
                    ? const Text(
                        'Call Patient',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    : const Text('Calling not supported'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> sympTom(List<bool> symp) {
    int i = 0;
    List<String> name = [
      'Fever',
      'Shivering',
      'Sore Throat',
      'Runny Nose',
      'Body Ache',
      'Headache'
    ];
    List<Widget> ll = [];
    for (i = 0; i < 5; i++) {
      ll.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          symp[i] == true
              ? const Icon(
                  Icons.check_box_outlined,
                  size: 20,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.check_box_outline_blank,
                  size: 20,
                  color: Colors.red,
                ),
          const SizedBox(
            width: 10,
          ),
          Text(name[i]),
        ],
      ));
    }
    return ll;
  }
}
