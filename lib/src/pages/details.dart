import 'package:flutter/material.dart';
import 'package:final_draft/src/pages/User.dart';

class DetailPage extends StatelessWidget {
  final Event event;
  DetailPage({Key? key, required this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyText2!,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  children: <Widget>[
                    topContent(context, event),
                    bottomContent(context, event)
                  ],
                ),
              ));
            })));
  }

  Stack topContent(BuildContext context, Event event) => Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10.0),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                      "https://res.cloudinary.com/backaand/image/upload/v1627326512/aq2g0nlzxvcsfm9dntgy.jpg"),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(40.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Center(
              child: topContentText(event),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      );

  Column topContentText(Event event) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 97.0),
          Text(
            event.title,
            style: TextStyle(color: Colors.white, fontSize: 45.0),
          ),
          Container(
            width: 90.0,
            child: new Divider(color: Colors.green),
          ),
          SizedBox(height: 10.0),
          Text(
            event.subtitle,
            style: TextStyle(color: Colors.grey[350], fontSize: 20.0),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Icon(Icons.calendar_today, color: Colors.white)),
              Expanded(
                  flex: 6,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        event.date,
                        style: TextStyle(color: Colors.white),
                      ))),
              Expanded(child: Icon(Icons.access_time, color: Colors.white)),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    // decoration: new BoxDecoration(
                    //     border: new Border.all(color: Colors.white),
                    //     borderRadius: BorderRadius.circular(5.0)),
                    child: new Text(
                      event.time,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ],
      );

  final levelIndicator = Container(
    child: Container(
      child: LinearProgressIndicator(
          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
          value: 0.5,
          valueColor: AlwaysStoppedAnimation(Colors.green)),
    ),
  );

  Text bottomContentText(Event event) => Text(
        event.description,
        style: TextStyle(fontSize: 18.0),
      );
  final readButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () => {},
        style:
            ElevatedButton.styleFrom(primary: Color.fromRGBO(58, 66, 86, 1.0)),
        child: Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
      ));
  Container bottomContent(BuildContext context, Event event) => Container(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[bottomContentText(event), readButton],
          ),
        ),
      );
}
