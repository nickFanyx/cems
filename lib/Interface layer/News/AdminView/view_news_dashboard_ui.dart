import 'package:cems/BLoC%20layer/News/AdminBloc/view_news_bloc.dart';
import 'package:cems/Data%20layer/News/news_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AViewNewsDashboard extends StatefulWidget {
  final NewsModel newsModel;
  const AViewNewsDashboard({Key? key, required this.newsModel})
      : super(key: key);

  @override
  State<AViewNewsDashboard> createState() => _AViewNewsDashboardState();
}

class _AViewNewsDashboardState extends State<AViewNewsDashboard> {
  ViewDashboardNewsBloc viewDashboardNewsBloc = ViewDashboardNewsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.newsModel.user_id}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.newsModel.news_id}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.newsModel.news_title}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.newsModel.news_description}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(' ${widget.newsModel.news_details}'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete?'),
                      content: const Text('Are you sure want to delete this news?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            viewDashboardNewsBloc
                                .deleteNoti(widget.newsModel.news_id);
                            Navigator.pop(context, 'YES');
                            Navigator.pop(context);
                          },
                          child: const Text('YES'),
                        )
                      ],
                    ),
                  );
                },
                child: Text("Delete Notification"),
              ),
            )
          ],
        )),
      ),
    );
  }
}
