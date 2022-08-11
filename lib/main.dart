import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_app/mobile_list.dart';
import 'error_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final _formloginkey = GlobalKey<FormState>();
final mobileController = TextEditingController();
int val = 0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formloginkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _textField(context),
              ],
            ),
          ),
        ));
    ;
  }
}

_header(context) {
  return Column(
    children: const [
      Text(
        "Welcome Back",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 32, fontFamily: 'poppins'),
      ),
      Text("Enter your credential",
          style: TextStyle(
              fontSize: 18, color: Colors.grey, fontFamily: 'poppins'))
    ],
  );
}

_textField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextFormField(
        controller: mobileController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Phone no is required";
          } else if (value.length != 10) {
            return "Mobile no must be 10 digit long";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          hintText: "Mobile no",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.phone,
      ),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () async {
          if (_formloginkey.currentState!.validate()) {
            final url = Uri.parse('http://firstoffer.co.in/api/mobile/login');
            final headers = {"Content-type": "application/json"};
            final json = '{"mobile_number": ${mobileController.text}}';
            final response = await post(url, headers: headers, body: json);
            if (response.statusCode == 200) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MobileList()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ErrorPage()));
            }
          }
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: const StadiumBorder()),
        child: const Text(
          "Login",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
        ),
      )
    ],
  );
}
