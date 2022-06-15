import 'package:cems/BLoC%20layer/Movement/AdminBloc/admin_dashboard_bloc.dart';
import 'package:cems/Data%20layer/Movement/move_record.dart';
import 'package:cems/Interface%20layer/Movement/AdminView/view_mov_rec_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AMovementRec extends StatefulWidget {
  const AMovementRec({Key? key}) : super(key: key);

  @override
  State<AMovementRec> createState() => _AMovementRecState();
}

class _AMovementRecState extends State<AMovementRec> {
  AMovRecBloc manageMovBloc = AMovRecBloc();
  TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

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
        var snap = MovementModel.fromSnapshot(recSnapshot);
        keyword = [
          snap.userId,
          snap.locationName,
          snap.movStatus,
          snap.name,
          snap.riskLevel,
          snap.vacStatus,
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
        .collection("MovementRecord")
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
          const SizedBox(height: 20),
          const Text(
            "Movement Record List",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
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
                      return manageMovBloc.listit(context, _resultsList[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget listit(BuildContext context, DocumentSnapshot document) {
    MovementModel rec = MovementModel.fromSnapshot(document);

    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AViewMoveRecUI(
                mvModel: rec,
              ),
            ),
          );
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
                image: AssetImage('assets/images/location.png'),
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
                    rec.name,
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
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink,
                  height: 15,
                  child: Text(
                    rec.movStatus,
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
