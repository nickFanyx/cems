import 'package:cems/BLoC%20layer/Quarantine/AdminBloc/admin_quar_rec_bloc.dart';
import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/manage_daily.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/view_quar_rec_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManageQuarRec extends StatefulWidget {
  const ManageQuarRec({Key? key}) : super(key: key);

  @override
  State<ManageQuarRec> createState() => _ManageQuarRecState();
}

class _ManageQuarRecState extends State<ManageQuarRec> {
  AManageQRBloc manageQRBloc = AManageQRBloc();
  TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  void refresh() {
    setState(() {
      _searchController.addListener(_onSearchChanged);
      getRecordStreamSnapshot();
      searchResultsList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getRecordStreamSnapshot();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var recSnapshot in _allResults) {
        List<String> keyword;
        var snap = QuarantineModel.fromSnapshot(recSnapshot);
        keyword = [
          snap.userId,
          snap.usertype,
          snap.symptomsDetail,
          snap.patientName,
          snap.patientNo,
          snap.quarantinePlace,
          snap.quarantineAddress,
          snap.testResult,
          snap.verifyResult,
          snap.username,
          snap.staffResponse,
          DateFormat('MMMM d, yyyy – KK : mm a')
              .format(((snap.dateTime)))
              .toString(),
        ];
        var data = keyword.toString().toLowerCase();

        if (data.contains(_searchController.text.toLowerCase())) {
          showResults.add(recSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getRecordStreamSnapshot() async {
    var data = await FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .orderBy("dateTime", descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Quarantine Record List',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Enter keyword",
              ),
            ),
          ),
          Expanded(
            child: _resultsList == []
                ? const Text('Loading')
                : ListView.builder(
                    itemCount: _resultsList.length,
                    itemBuilder: (context, index) {
                      return listit(context, _resultsList[index]);
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageDailyStat(),
                  ),
                );
              },
              child: const Text('View Daily Status'),
            ),
          ),
        ],
      ),
    );
  }

  Widget listit(BuildContext context, DocumentSnapshot document) {
    QuarantineModel rec = QuarantineModel.fromSnapshot(document);

    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AViewRecUI(
                qrModel: rec,
              ),
            ),
          );
          if (value == true) {
            refresh();
          }
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rec.usertype,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    DateFormat('MMMM d, yyyy – KK : mm a')
                        .format(((rec.dateTime))),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 15,
                  child: Text(
                    rec.verifyResult,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
