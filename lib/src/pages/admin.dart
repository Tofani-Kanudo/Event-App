import 'package:final_draft/src/pages/create_event.dart';
import 'User.dart';
import 'create_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
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
  String error = "";
  FocusNode focusNode = new FocusNode();
  FocusNode focusNode1 = new FocusNode();
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNode,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an email address';
              } else if (!_emailRegExp.hasMatch(value)) {
                return 'Invalid email address!';
              }
              return null;
            },
            onSaved: (value) {
              model = value!;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            focusNode: focusNode1,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            onSaved: (value) {
              password = value!;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        style: TextButton.styleFrom(padding: EdgeInsets.only(right: 0.0)),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  late String _token;
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            primary: Colors.white,
            elevation: 5.0,
          ),
          onPressed: () {
            focusNode1.unfocus();
            focusNode.unfocus();
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              var token = login(model, password);
              // token.then((User value) => _token = value);
              token.then((value) {
                if (value.error == "None") {
                  _token = value.access;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Creator()));
                } else {
                  final snackbar = SnackBar(
                    content: Text(value.error),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              });
            }
          },
          child: Text(
            'ADMIN LOGIN',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          )),
    );
  }

  final _formKey = GlobalKey<FormState>();
  var model = "";
  var password = "";
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(children: <Widget>[
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
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          _buildEmailTF(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTF(),
                          _buildForgotPasswordBtn(),
                          _buildLoginBtn(),
                        ])),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   // Build a Form widget using the _formKey created above.
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Admin Login"),
  //         backgroundColor: darkBlue,
  //         bottomOpacity: 0,
  //         elevation: 0,
  //         centerTitle: true,
  //       ),
  //       body: Center(
  //           child: Form(
  //         key: _formKey,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             // Add TextFormFields and ElevatedButton here.
  //             TextFormField(
  //               // The validator receives the text that the user has entered.
  //               validator: (value) {
  //                 if (value == null || value.isEmpty) {
  //                   return 'Please enter some text';
  //                 }
  //                 return null;
  //               },
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Validate returns true if the form is valid, or false otherwise.
  //                 if (_formKey.currentState!.validate()) {
  //                   // If the form is valid, display a snackbar. In the real world,
  //                   // you'd often call a server or save the information in a database.
  //                   ScaffoldMessenger.of(context).showSnackBar(
  //                     const SnackBar(content: Text('Processing Data')),
  //                   );
  //                 }
  //               },
  //               child: const Text('Submit'),
  //             ),
  //           ],
  //         ),
  //       )));
  // }