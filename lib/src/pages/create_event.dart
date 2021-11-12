import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Creator extends StatefulWidget {
  Creator({
    Key? key,
  }) : super(key: key);

  @override
  State<Creator> createState() => _CreatorState();
}

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
var title = "";
var subt = "";
var desc = "";
FocusNode titNode = new FocusNode();
FocusNode subNode = new FocusNode();
FocusNode descNode = new FocusNode();
final _formKey = GlobalKey<FormState>();
Widget _buildTitleTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Title',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              keyboardType: TextInputType.text,
              focusNode: titNode,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an Title';
                } else if (value.length < 3) {
                  return 'Invalid Event Title!';
                }
                return null;
              },
              onSaved: (value) {
                title = value!;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.title,
                  color: Colors.white,
                ),
                hintText: 'Enter Title',
                hintStyle: kHintTextStyle,
              ),
            ),
          )),
    ],
  );
}

Widget _buildSubTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Subtitle',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextFormField(
          keyboardType: TextInputType.text,
          focusNode: subNode,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter an SubTitle';
            } else if (value.length < 3) {
              return 'Invalid Event SubTitle!';
            }
            return null;
          },
          onSaved: (value) {
            subt = value!;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.create_outlined,
              color: Colors.white,
            ),
            hintText: 'Enter SubTitle',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildDesTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Description',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 200.0,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          focusNode: descNode,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter an Description';
            } else if (value.length < 3) {
              return 'Invalid Event Description!';
            }
            return null;
          },
          onSaved: (value) {
            title = value!;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20.0),
            prefixIcon: Icon(
              Icons.subtitles,
              color: Colors.white,
            ),
            hintText: 'Enter Description',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

DateTime selectedDate = DateTime.now();
_selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate, // Refer step 1
    firstDate: selectedDate,
    lastDate: selectedDate.add(const Duration(days: 365)),
    initialEntryMode: DatePickerEntryMode.input,
    helpText: 'Pick Event Date',
    fieldLabelText: 'Event date',
  );
  if (picked != null && picked != selectedDate) selectedDate = picked;
}

Widget _buildDaTF(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Date',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 140.0,
          child: Column(children: <Widget>[
            // Text(
            //   "${selectedDate.toLocal()}".split(' ')[0],
            //   style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context), // Refer step 3
              child: Text(
                'Select date',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ])),
    ],
  );
}

class _CreatorState extends State<Creator> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 300,
            ),
            child: IntrinsicHeight(
                child: Column(children: <Widget>[
              _buildTitleTF(),
              _buildSubTF(),
              _buildDesTF(),
              // _buildDaTF(context)
            ]))));
  }
}
