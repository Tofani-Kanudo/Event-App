// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:final_draft/src/pages/cards.dart';
import 'package:flutter/material.dart';
import 'package:final_draft/src/pages/User.dart';
import 'package:final_draft/src/pages/appbar.dart';
import 'package:final_draft/src/pages/admin.dart';
// import 'package:final_draft/src/pages/bottombar.dart';

void main() => runApp(EventList());

class EventList extends StatefulWidget {
  EventList({Key? key}) : super(key: key);
  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late Future<List<Event>> futureEvent;

  @override
  void initState() {
    super.initState();
    futureEvent = events();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(
            title: Text("Events"),
            backgroundColor: Colors.blue,
            bottomOpacity: 0,
            elevation: 0,
            centerTitle: true,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyCustomForm()));
          },
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.blue.shade700,
                    Colors.blue.shade800,
                    Colors.blue.shade900,
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Center(
              child: ListParallax(),
            ),
          ],
        ));

    // return MaterialApp(
    //   title: 'Fetch Data Example',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Scaffold(
    //     bottomNavigationBar: makeBottom,
    //     appBar: AppBar(
    //       title: Text('Fetch Data Example'),
    //       elevation: .1,
    //       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    //       actions: <Widget>[
    //         IconButton(
    //           icon: Icon(Icons.list),
    //           onPressed: () {},
    //         )
    //       ],
    //     ),
    //     body: Center(
    //       child: FutureBuilder<List<Event>>(
    //         future: futureEvent,
    //         builder: (context, snapshot) {
    //           // print(snapshot.data![0].runtimeType);
    //           if (snapshot.hasData) {
    //             return ListView.builder(
    //                 scrollDirection: Axis.vertical,
    //                 shrinkWrap: true,
    //                 itemCount: snapshot.data!.length,
    //                 itemBuilder: (context, index) {
    //                   return Card(
    //                     elevation: 8.0,
    //                     margin: new EdgeInsets.symmetric(
    //                         horizontal: 10.0, vertical: 6.0),
    //                     child: Container(
    //                         decoration: BoxDecoration(
    //                             color: Color.fromRGBO(64, 75, 96, .9)),
    //                         child: tile(snapshot, index, context)),
    //                   );
    //                 });
    //           } else if (snapshot.hasError) {
    //             return Text("${snapshot.error}");
    //           }

    //           // By default, show a loading spinner.
    //           return CircularProgressIndicator();
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
