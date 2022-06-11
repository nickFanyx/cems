import 'package:cems/BLoC%20layer/News/AdminBloc/add_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AAddNews extends StatefulWidget {
  const AAddNews({Key? key}) : super(key: key);

  @override
  State<AAddNews> createState() => _AAddNewsState();
}

class _AAddNewsState extends State<AAddNews> {
  AddNewsBloc addNewsBloc = AddNewsBloc();

  String news_id = "";
  String news_title = "";
  String news_description = "";
  String news_details = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add News'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('News Title'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => news_title = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                        )
                      ]),
                )),
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('News Description'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => news_description = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                          ),
                        )
                      ]),
                )),
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('News Details'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => news_details = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Details',
                          ),
                        )
                      ]),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                addNewsBloc.addNews(
                    "1", news_id, news_title, news_description, news_details);
              },
              child: const Text(
                'Publish',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
